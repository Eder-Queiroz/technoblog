export abstract class IDeleteArticleUseCase {
  abstract execute(articleId: bigint, userId: bigint): Promise<void>;
}
