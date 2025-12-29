import { DatabaseModule } from '@database';
import { Global, Module } from '@nestjs/common';
import { UserRepositoryProvider } from './domain';
import { AuthUseCaseProvider } from './use-cases/auth.use-case';
import { AuthController } from './controller/auth.controller';
import { JwtService } from '@nestjs/jwt';
import { VerifyTokenUseCaseProvider } from './use-cases/verify-token.use-case';
import { GetUserUseCaseProvider } from './use-cases/get-user.use-case';
import { UserController } from './controller/user.controller';

@Global()
@Module({
  imports: [DatabaseModule],
  controllers: [AuthController, UserController],
  providers: [
    UserRepositoryProvider,
    AuthUseCaseProvider,
    VerifyTokenUseCaseProvider,
    GetUserUseCaseProvider,
    JwtService,
  ],
  exports: [
    UserRepositoryProvider,
    AuthUseCaseProvider,
    VerifyTokenUseCaseProvider,
    GetUserUseCaseProvider,
  ],
})
export class UsersModule {}
