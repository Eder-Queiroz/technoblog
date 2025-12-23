import { IUpdateArticleInput } from '../input/update-article-input.interface';

export abstract class IUpdateArticleUseCase {
  abstract execute(
    articleId: bigint,
    userId: bigint,
    input: IUpdateArticleInput,
  ): Promise<void>;
}
