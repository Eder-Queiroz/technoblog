import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { AuthOutput, IAuthInput, IAuthUseCase } from '@users/shared';
import { OAuth2Client } from 'google-auth-library';

export class AuthUseCase implements IAuthUseCase {
  private readonly googleClient: OAuth2Client;

  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {
    const clientId = this.configService.getOrThrow<string>('google.clientId');
    this.googleClient = new OAuth2Client(clientId);
  }

  execute(dto: IAuthInput): Promise<AuthOutput> {
    console.log(dto);
    return Promise.resolve(new AuthOutput('accessToken'));
  }
}
