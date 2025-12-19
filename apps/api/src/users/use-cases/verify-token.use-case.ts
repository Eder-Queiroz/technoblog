import {
  Injectable,
  InternalServerErrorException,
  Provider,
  UnauthorizedException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JsonWebTokenError, JwtService, TokenExpiredError } from '@nestjs/jwt';
import { IBaseUserEntityData } from '@shared';
import {
  IJwtPayload,
  IUserRepository,
  IVerifyTokenUseCase,
} from '@users/shared';

@Injectable()
export class VerifyTokenUseCase implements IVerifyTokenUseCase {
  private readonly jwtSecret: string;

  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
    private readonly userRepository: IUserRepository,
  ) {
    this.jwtSecret = this.configService.getOrThrow<string>('jwt.secret');
  }

  async execute(token: string): Promise<IBaseUserEntityData> {
    try {
      const decoded = await this.jwtService.verifyAsync<IJwtPayload>(token, {
        secret: this.jwtSecret,
      });

      if (!decoded) {
        throw new UnauthorizedException('Invalid token');
      }

      const userId = BigInt(decoded.id);

      const user = await this.userRepository.findById(userId);

      if (!user) {
        throw new UnauthorizedException('User not found');
      }

      return user;
    } catch (error) {
      if (
        error instanceof JsonWebTokenError ||
        error instanceof TokenExpiredError
      ) {
        throw new UnauthorizedException('Invalid token');
      }

      throw new InternalServerErrorException('An unexpected error occurred');
    }
  }
}

export const VerifyTokenUseCaseProvider: Provider<IVerifyTokenUseCase> = {
  provide: IVerifyTokenUseCase,
  useClass: VerifyTokenUseCase,
};
