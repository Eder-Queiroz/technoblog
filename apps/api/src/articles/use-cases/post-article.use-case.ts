import { ArticleEntity } from '@articles/domain';
import {
  IArticleRepository,
  IArticleTagRepository,
  IPostArticleInput,
  IPostArticleUseCase,
  ITagRepository,
} from '@articles/shared';
import { NotFoundException } from '@nestjs/common';

export class PostArticleUseCase implements IPostArticleUseCase {
  constructor(
    private readonly articleRepository: IArticleRepository,
    private readonly articleTagRepository: IArticleTagRepository,
    private readonly tagRepository: ITagRepository,
  ) {}

  async execute(
    { title, content, tagIds }: IPostArticleInput,
    authorId: bigint,
  ): Promise<void> {
    if (!(await this.allTagsExist(tagIds))) {
      throw new NotFoundException('Some tags do not exist');
    }

    const article = await this.articleRepository.create(
      ArticleEntity.create({
        title,
        content,
        authorId,
      }),
    );

    await this.articleTagRepository.createMany({
      articleId: article.id,
      tagIds,
    });
  }

  private async allTagsExist(tagIds: number[]): Promise<boolean> {
    const tags = await this.tagRepository.findByIds(tagIds);

    if (tags.length !== tagIds.length) {
      return false;
    }

    return true;
  }
}
