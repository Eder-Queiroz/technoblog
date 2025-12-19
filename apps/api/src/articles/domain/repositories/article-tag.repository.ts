import { IArticleTagEntity, IArticleTagRepository } from '@articles/shared';
import { PrismaService } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { ArticleTagEntity } from '../entities/article-tag.entity';

@Injectable()
export class ArticleTagRepository implements IArticleTagRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(articleTag: IArticleTagEntity): Promise<IArticleTagEntity> {
    const createdArticleTag = await this.prisma.articleTag.create({
      data: articleTag.toPersistence(),
    });

    return ArticleTagEntity.restore(createdArticleTag);
  }

  async createMany({
    articleId,
    tagIds,
  }: {
    articleId: bigint;
    tagIds: number[];
  }): Promise<IArticleTagEntity[]> {
    const createdArticleTags = await this.prisma.articleTag.createManyAndReturn(
      {
        data: tagIds.map((tagId) => ({
          articleId,
          tagId,
        })),
      },
    );

    return createdArticleTags.map(ArticleTagEntity.restore);
  }
}

export const ArticleTagRepositoryProvider: Provider<IArticleTagRepository> = {
  provide: IArticleTagRepository,
  useClass: ArticleTagRepository,
};
