import {
  IArticleEntity,
  IArticleRepository,
  IArticleTagRepository,
  ITagRepository,
  type IUpdateArticleInput,
  IUpdateArticleUseCase,
  ArticleNotAuthorException,
} from '@articles/shared';
import { Transactional } from '@database';
import {
  ForbiddenException,
  Injectable,
  NotFoundException,
  Provider,
} from '@nestjs/common';

@Injectable()
export class UpdateArticleUseCase implements IUpdateArticleUseCase {
  constructor(
    private readonly articleRepository: IArticleRepository,
    private readonly articleTagRepository: IArticleTagRepository,
    private readonly tagRepository: ITagRepository,
  ) {}

  @Transactional()
  async execute(
    articleId: bigint,
    userId: bigint,
    input: IUpdateArticleInput,
  ): Promise<void> {
    try {
      const article = await this.articleRepository.findById(articleId);

      if (!article) {
        throw new NotFoundException('Article not found');
      }

      if (!(await this.allTagsExist(input.tagIds))) {
        throw new NotFoundException('Some tags do not exist');
      }

      article.update(input, userId);

      await this.articleRepository.update(article);
      await this.updateArticleTags(article, input.tagIds);
    } catch (error) {
      if (error instanceof ArticleNotAuthorException) {
        throw new ForbiddenException(error.message);
      }
      throw error;
    }
  }

  private async allTagsExist(tagIds: number[]): Promise<boolean> {
    if (tagIds.length === 0) {
      return true;
    }

    const tags = await this.tagRepository.findByIds(tagIds);

    if (tags.length !== tagIds.length) {
      return false;
    }

    return true;
  }

  private async updateArticleTags(
    article: IArticleEntity,
    tagIds: number[],
  ): Promise<void> {
    await this.createNewArticleTags(article, tagIds);
    await this.deleteArticleTags(article, tagIds);
  }

  private async createNewArticleTags(
    article: IArticleEntity,
    tagIds: number[],
  ): Promise<void> {
    const currentTagIds =
      article.articleTags?.map((articleTag) => articleTag.tagId) ?? [];

    const newTagIds = tagIds.filter((tagId) => !currentTagIds.includes(tagId));

    if (newTagIds.length === 0) return;

    await this.articleTagRepository.createMany({
      articleId: article.id,
      tagIds: newTagIds,
    });
  }

  private async deleteArticleTags(
    article: IArticleEntity,
    tagIds: number[],
  ): Promise<void> {
    const currentArticleTags = await this.articleTagRepository.findByArticleId(
      article.id,
    );
    const deletedArticleTags = currentArticleTags.filter(
      (articleTag) => !tagIds.includes(articleTag.tagId),
    );

    if (deletedArticleTags.length === 0) return;

    for (const articleTag of deletedArticleTags) {
      articleTag.delete();
      await this.articleTagRepository.update(articleTag);
    }
  }
}

export const UpdateArticleUseCaseProvider: Provider<IUpdateArticleUseCase> = {
  provide: IUpdateArticleUseCase,
  useClass: UpdateArticleUseCase,
};
