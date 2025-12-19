import { ITagEntity, ITagRepository } from '@articles/shared';
import { PrismaService } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { TagEntity } from '../entities/tag.entity';

@Injectable()
export class TagRepository implements ITagRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByIds(ids: number[]): Promise<ITagEntity[]> {
    const tags = await this.prisma.tag.findMany({
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
