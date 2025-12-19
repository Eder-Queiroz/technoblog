import { Module } from '@nestjs/common';
import { DatabaseModule } from './database/database.module';
import { UsersModule } from './users/users.module';
import { ConfigModule } from '@nestjs/config';
import { validate } from '@config/environment-variables-validation';
import { ArticlesModule } from './articles/articles.module';
import configuration from '@config/configuration';
import { AuthGuard } from '@shared';

@Module({
  imports: [
    DatabaseModule,
    UsersModule,
    ConfigModule.forRoot({
      isGlobal: true,
      validate: validate,
      load: [configuration],
    }),
    ArticlesModule,
  ],
  providers: [AuthGuard],
  exports: [AuthGuard],
})
export class AppModule {}
