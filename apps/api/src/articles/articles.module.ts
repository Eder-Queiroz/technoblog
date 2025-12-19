import { DatabaseModule } from '@database';
import { Module } from '@nestjs/common';
import {
  ArticleRepositoryProvider,
  ArticleTagRepositoryProvider,
  TagRepositoryProvider,
} from './domain';
import { ArticleController } from './controller/article.controller';
import { PostArticleUseCaseProvider } from './use-cases/post-article.use-case';

@Module({
  imports: [DatabaseModule],
  controllers: [ArticleController],
  providers: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
    PostArticleUseCaseProvider,
  ],
  exports: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
    PostArticleUseCaseProvider,
  ],
})
export class ArticlesModule {}
