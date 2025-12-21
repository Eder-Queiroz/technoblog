import { IArticleEntity, IArticleRepository } from '@articles/shared';
import { PrismaService } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { ArticleEntity } from '..';
import { Prisma } from 'generated/prisma';

@Injectable()
export class ArticleRepository implements IArticleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(article: IArticleEntity): Promise<IArticleEntity> {
    const createdArticle = await this.prisma.article.create({
      data: article.toPersistence(),
      include: {
        articleTags: true,
      },
    });

    return ArticleEntity.restore(createdArticle);
  }

  async findAll({
    page,
    limit,
    search,
    tagIds,
  }: {
    page: number;
    limit: number;
    search?: string;
    tagIds?: number[];
  }): Promise<{
    articles: IArticleEntity[];
    total: number;
  }> {
    const where: Prisma.ArticleWhereInput = {
      deletedAt: null,
    };

    if (search) {
      where.title = {
        contains: search,
        mode: 'insensitive',
      };
    }

    if (tagIds) {
      where.articleTags = {
        some: {
          tagId: {
            in: tagIds,
          },
        },
      };
    }

    const [articles, total] = await Promise.all([
      this.prisma.article.findMany({
        skip: (page - 1) * limit,
        take: limit,
        where,
        include: {
          articleTags: {
            include: {
              tag: true,
            },
          },
        },
      }),
      this.prisma.article.count({ where }),
    ]);

    return {
      articles: articles.map(ArticleEntity.restore),
      total,
    };
  }

  async findById(id: number): Promise<IArticleEntity | null> {
    const article = await this.prisma.article.findUnique({
      where: {
        id,
        deletedAt: null,
      },
    });

    if (!article) {
      return null;
    }

    return ArticleEntity.restore(article);
  }

  async update(article: IArticleEntity): Promise<IArticleEntity> {
    const updatedArticle = await this.prisma.article.update({
      where: {
        id: article.id,
      },
      data: article.toPersistence(),
    });
    return ArticleEntity.restore(updatedArticle);
  }
}

export const ArticleRepositoryProvider: Provider<IArticleRepository> = {
  provide: IArticleRepository,
  useClass: ArticleRepository,
};
