import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { IVerifyTokenUseCase } from '@users/shared';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private readonly verifyTokenUseCase: IVerifyTokenUseCase) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();

    const [type, token] = (request.headers.authorization?.split(' ') ??
      []) as string[];

    if (type !== 'Bearer' || !token) {
      throw new UnauthorizedException('Invalid authorization header');
    }

    const user = await this.verifyTokenUseCase.execute(token);

    request.user = user;

    return true;
  }
}
