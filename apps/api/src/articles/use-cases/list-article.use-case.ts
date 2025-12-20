import {
  ArticleOutput,
  IArticleRepository,
  IListArticlesUseCase,
  IPaginatedArticleInput,
  IPaginatedArticlesOutput,
  PaginatedArticlesOutput,
} from '@articles/shared';
import { Injectable, Provider } from '@nestjs/common';

@Injectable()
export class ListArticleUseCase implements IListArticlesUseCase {
  constructor(private readonly articleRepository: IArticleRepository) {}

  async execute({
    page,
    limit,
    search,
    tagIds,
  }: IPaginatedArticleInput): Promise<IPaginatedArticlesOutput> {
    const { articles, total } = await this.articleRepository.findAll({
      page,
      limit,
      search,
      tagIds,
    });

    return new PaginatedArticlesOutput({
      data: articles.map(ArticleOutput.fromEntity),
      total,
    });
  }
}

export const ListArticleUseCaseProvider: Provider<IListArticlesUseCase> = {
  provide: IListArticlesUseCase,
  useClass: ListArticleUseCase,
};
