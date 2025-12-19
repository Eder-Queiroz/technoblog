import { DatabaseModule } from '@database';
import { Module } from '@nestjs/common';
import {
  ArticleRepositoryProvider,
  ArticleTagRepositoryProvider,
  TagRepositoryProvider,
} from './domain';

@Module({
  imports: [DatabaseModule],
  providers: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
  ],
  exports: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
  ],
})
export class ArticlesModule {}
