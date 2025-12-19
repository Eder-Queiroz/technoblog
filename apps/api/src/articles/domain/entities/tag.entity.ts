import {
  ITagEntity,
  ITagEntityData,
  ITagEntityPersistence,
  ITagEntityProps,
} from '@articles/shared';
import { ArticleTagEntity } from './article-tag.entity';

export class TagEntity implements ITagEntity {
  id: number;
  name: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
  articleTags?: ArticleTagEntity[];

  private constructor(private readonly props: ITagEntityData) {
    this.id = props.id;
    this.name = props.name;
    this.createdAt = props.createdAt;
    this.updatedAt = props.updatedAt;
    this.deletedAt = props.deletedAt;
    this.articleTags =
      props.articleTags?.map((articleTag) =>
        ArticleTagEntity.restore(articleTag),
      ) ?? undefined;
  }

  static create(props: ITagEntityProps): TagEntity {
    return new TagEntity({
      ...props,
      id: 0,
      createdAt: new Date(),
      updatedAt: new Date(),
      deletedAt: null,
    });
  }

  static restore(props: ITagEntityData): TagEntity {
    return new TagEntity(props);
  }

  toPersistence(): ITagEntityPersistence {
    return {
      id: this.id,
      name: this.name,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      deletedAt: this.deletedAt,
    };
  }
}
