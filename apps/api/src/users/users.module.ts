import { DatabaseModule } from '@database';
import { Global, Module } from '@nestjs/common';
import { UserRepositoryProvider } from './domain';
import { AuthUseCaseProvider } from './use-cases/auth.use-case';
import { AuthController } from './controller/auth.controller';
import { JwtService } from '@nestjs/jwt';
import { VerifyTokenUseCaseProvider } from './use-cases/verify-token.use-case';

@Global()
@Module({
  imports: [DatabaseModule],
  controllers: [AuthController],
  providers: [
    UserRepositoryProvider,
    AuthUseCaseProvider,
    VerifyTokenUseCaseProvider,
    JwtService,
  ],
  exports: [
    UserRepositoryProvider,
    AuthUseCaseProvider,
    VerifyTokenUseCaseProvider,
  ],
})
export class UsersModule {}
