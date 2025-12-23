import { IArticleTagEntity } from '..';

export abstract class IArticleTagRepository {
  abstract create(articleTag: IArticleTagEntity): Promise<IArticleTagEntity>;
  abstract createMany({
    articleId,
    tagIds,
  }: {
    articleId: bigint;
    tagIds: number[];
  }): Promise<IArticleTagEntity[]>;

  abstract update(articleTag: IArticleTagEntity): Promise<IArticleTagEntity>;

  abstract findByArticleId(articleId: bigint): Promise<IArticleTagEntity[]>;
}
