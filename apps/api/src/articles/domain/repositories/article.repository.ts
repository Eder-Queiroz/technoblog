import { IArticleEntity, IArticleRepository } from '@articles/shared';
import { PrismaService } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { ArticleEntity } from '..';

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
}

export const ArticleRepositoryProvider: Provider<IArticleRepository> = {
  provide: IArticleRepository,
  useClass: ArticleRepository,
};
