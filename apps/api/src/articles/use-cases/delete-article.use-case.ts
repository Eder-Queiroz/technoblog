import {
  ArticleNotAuthorException,
  IArticleRepository,
  IDeleteArticleUseCase,
} from '@articles/shared';
import {
  ForbiddenException,
  Injectable,
  NotFoundException,
  Provider,
} from '@nestjs/common';

@Injectable()
export class DeleteArticleUseCase implements IDeleteArticleUseCase {
  constructor(private readonly articleRepository: IArticleRepository) {}

  async execute(articleId: number, userId: bigint): Promise<void> {
    try {
      const article = await this.articleRepository.findById(articleId);

      if (!article) {
        throw new NotFoundException('Article not found');
      }

      article.delete(userId);

      await this.articleRepository.update(article);
    } catch (error) {
      if (error instanceof ArticleNotAuthorException) {
        throw new ForbiddenException(error.message);
      }
      throw error;
    }
  }
}

export const DeleteArticleUseCaseProvider: Provider<IDeleteArticleUseCase> = {
  provide: IDeleteArticleUseCase,
  useClass: DeleteArticleUseCase,
};
