import { IPaginatedArticleInput, IPaginatedArticlesOutput } from '..';

export abstract class IListArticlesUseCase {
  abstract execute(
    input: IPaginatedArticleInput,
  ): Promise<IPaginatedArticlesOutput>;
}
