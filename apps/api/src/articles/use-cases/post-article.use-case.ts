import { ArticleEntity } from '@articles/domain';
import {
  IArticleRepository,
  IArticleTagRepository,
  type IPostArticleInput,
  IPostArticleUseCase,
  ITagRepository,
} from '@articles/shared';
import { Transactional } from '@database';
import { Injectable, NotFoundException, Provider } from '@nestjs/common';

@Injectable()
export class PostArticleUseCase implements IPostArticleUseCase {
  constructor(
    private readonly articleRepository: IArticleRepository,
    private readonly articleTagRepository: IArticleTagRepository,
    private readonly tagRepository: ITagRepository,
  ) {}

  @Transactional()
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

    if (tagIds.length > 0) {
      await this.articleTagRepository.createMany({
        articleId: article.id,
        tagIds,
      });
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
}

export const PostArticleUseCaseProvider: Provider<IPostArticleUseCase> = {
  provide: IPostArticleUseCase,
  useClass: PostArticleUseCase,
};
