import { ITagEntity, ITagRepository } from '@articles/shared';
import { PrismaService, TransactionClient } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { TagEntity } from '../entities/tag.entity';
import { PrismaClient } from 'generated/prisma';

@Injectable()
export class TagRepository implements ITagRepository {
  constructor(private readonly prisma: PrismaService) {}

  private get client(): PrismaClient | TransactionClient {
    return this.prisma.getClient();
  }

  async findByIds(ids: number[]): Promise<ITagEntity[]> {
    const tags = await this.client.tag.findMany({
      where: {
        id: {
          in: ids,
        },
      },
    });

    return tags.map(TagEntity.restore);
  }
}

export const TagRepositoryProvider: Provider<ITagRepository> = {
  provide: ITagRepository,
  useClass: TagRepository,
};
