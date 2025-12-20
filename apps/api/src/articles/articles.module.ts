import { DatabaseModule } from '@database';
import { Module } from '@nestjs/common';
import {
  ArticleRepositoryProvider,
  ArticleTagRepositoryProvider,
  TagRepositoryProvider,
} from './domain';
import { ArticleController } from './controller/article.controller';
import { PostArticleUseCaseProvider } from './use-cases/post-article.use-case';
import { ListArticleUseCaseProvider } from './use-cases/list-article.use-case';

@Module({
  imports: [DatabaseModule],
  controllers: [ArticleController],
  providers: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
    PostArticleUseCaseProvider,
    ListArticleUseCaseProvider,
  ],
  exports: [
    ArticleRepositoryProvider,
    ArticleTagRepositoryProvider,
    TagRepositoryProvider,
    PostArticleUseCaseProvider,
    ListArticleUseCaseProvider,
  ],
})
export class ArticlesModule {}
