import { DatabaseModule } from '@database';
import { Module } from '@nestjs/common';
import { UserRepositoryProvider } from './domain';
import { AuthUseCaseProvider } from './use-cases/auth.use-case';
import { AuthController } from './controller/auth.controller';
import { JwtService } from '@nestjs/jwt';

@Module({
  imports: [DatabaseModule],
  controllers: [AuthController],
  providers: [UserRepositoryProvider, AuthUseCaseProvider, JwtService],
  exports: [UserRepositoryProvider, AuthUseCaseProvider],
})
export class UsersModule {}
