import { IArticleTagEntity, IArticleTagRepository } from '@articles/shared';
import { PrismaService, TransactionClient } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { ArticleTagEntity } from '../entities/article-tag.entity';
import { PrismaClient } from 'generated/prisma';

@Injectable()
export class ArticleTagRepository implements IArticleTagRepository {
  constructor(private readonly prisma: PrismaService) {}

  private get client(): PrismaClient | TransactionClient {
    return this.prisma.getClient();
  }

  async create(articleTag: IArticleTagEntity): Promise<IArticleTagEntity> {
    const createdArticleTag = await this.client.articleTag.create({
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
    const createdArticleTags = await this.client.articleTag.createManyAndReturn(
      {
        data: tagIds.map((tagId) => ({
          articleId,
          tagId,
        })),
      },
    );

    return createdArticleTags.map(ArticleTagEntity.restore);
  }

  async update(articleTag: IArticleTagEntity): Promise<IArticleTagEntity> {
    const updatedArticleTag = await this.client.articleTag.update({
      where: {
        id: articleTag.id,
      },
      data: articleTag.toPersistence(),
    });

    return ArticleTagEntity.restore(updatedArticleTag);
  }

  async findByArticleId(articleId: bigint): Promise<IArticleTagEntity[]> {
    const articleTags = await this.client.articleTag.findMany({
      where: {
        articleId,
        deletedAt: null,
      },
    });

    return articleTags.map(ArticleTagEntity.restore);
  }
}

export const ArticleTagRepositoryProvider: Provider<IArticleTagRepository> = {
  provide: IArticleTagRepository,
  useClass: ArticleTagRepository,
};
