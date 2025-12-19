import { IArticleEntity } from '..';

export abstract class IArticleRepository {
  abstract create(article: IArticleEntity): Promise<IArticleEntity>;
}
