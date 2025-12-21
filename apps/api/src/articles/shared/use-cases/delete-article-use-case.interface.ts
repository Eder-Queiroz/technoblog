export abstract class IDeleteArticleUseCase {
  abstract execute(articleId: number, userId: bigint): Promise<void>;
}
