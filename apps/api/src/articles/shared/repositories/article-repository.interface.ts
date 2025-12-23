import { IArticleEntity } from '..';

export abstract class IArticleRepository {
  abstract create(article: IArticleEntity): Promise<IArticleEntity>;
  abstract findAll({
    page,
    limit,
    search,
    tagIds,
  }: {
    page: number;
    limit: number;
    search?: string;
    tagIds?: number[];
  }): Promise<{
    articles: IArticleEntity[];
    total: number;
  }>;
  abstract findById(id: bigint): Promise<IArticleEntity | null>;
  abstract update(article: IArticleEntity): Promise<IArticleEntity>;
}
