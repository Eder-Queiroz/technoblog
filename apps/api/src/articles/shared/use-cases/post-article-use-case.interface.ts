import { IPostArticleInput } from '../input/post-article-input.interface';

export abstract class IPostArticleUseCase {
  abstract execute(dto: IPostArticleInput, authorId: bigint): Promise<void>;
}
