import { Injectable, Provider, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { UserEntity } from '@users/domain';
import {
  AuthOutput,
  IAuthInput,
  IAuthUseCase,
  IUserRepository,
} from '@users/shared';
import { OAuth2Client } from 'google-auth-library';

@Injectable()
export class AuthUseCase implements IAuthUseCase {
  private readonly googleClient: OAuth2Client;
  private readonly clientId: string;
  private readonly jwtPrivateKey: string;
  private readonly jwtSecret: string;

  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
    private readonly userRepository: IUserRepository,
  ) {
    this.clientId = this.configService.getOrThrow<string>('google.clientId');
    this.googleClient = new OAuth2Client(this.clientId);

    this.jwtPrivateKey =
      this.configService.getOrThrow<string>('jwt.privateKey');
    this.jwtSecret = this.configService.getOrThrow<string>('jwt.secret');
  }

  async execute(dto: IAuthInput): Promise<AuthOutput> {
    const { idToken } = dto;

    const ticket = await this.googleClient.verifyIdToken({
      idToken,
      audience: this.clientId,
    });

    const payload = ticket.getPayload();

    if (!payload) {
      throw new UnauthorizedException('Invalid Google ID token');
    }

    const { sub: googleId, email, name, picture } = payload;

    if (!email || !googleId || !name || !picture) {
      throw new UnauthorizedException('Invalid user data');
    }

    const user = UserEntity.create({
      googleId,
      email,
      fullName: name,
      avatarUrl: picture,
    });

    const updatedUser = await this.userRepository.upsert(user);
    const token = this.jwtService.sign(updatedUser.id.toString(), {
      privateKey: this.jwtPrivateKey,
      secret: this.jwtSecret,
    });

    return new AuthOutput(token);
  }
}

export const AuthUseCaseProvider: Provider<IAuthUseCase> = {
  provide: IAuthUseCase,
  useClass: AuthUseCase,
};
