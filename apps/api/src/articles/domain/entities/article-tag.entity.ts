import {
  IArticleTagEntity,
  IArticleTagEntityData,
  IArticleTagEntityPersistence,
  IArticleTagEntityProps,
} from '@articles/shared';
import { ArticleEntity } from '..';
import { TagEntity } from './tag.entity';

export class ArticleTagEntity implements IArticleTagEntity {
  id: bigint;
  articleId: bigint;
  tagId: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
  article?: ArticleEntity;
  tag?: TagEntity;

  private constructor(private readonly props: IArticleTagEntityData) {
    this.id = props.id;
    this.articleId = props.articleId;
    this.tagId = props.tagId;
    this.createdAt = props.createdAt;
    this.updatedAt = props.updatedAt;
    this.deletedAt = props.deletedAt;
    this.article = props.article
      ? ArticleEntity.restore(props.article)
      : undefined;
    this.tag = props.tag ? TagEntity.restore(props.tag) : undefined;
  }

  static create(props: IArticleTagEntityProps): ArticleTagEntity {
    return new ArticleTagEntity({
      ...props,
      id: 0n,
      createdAt: new Date(),
      updatedAt: new Date(),
      deletedAt: null,
    });
  }

  static restore(props: IArticleTagEntityData): ArticleTagEntity {
    return new ArticleTagEntity(props);
  }

  toPersistence(): IArticleTagEntityPersistence {
    return {
      id: this.id,
      articleId: this.articleId,
      tagId: this.tagId,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      deletedAt: this.deletedAt,
    };
  }

  delete(): void {
    this.deletedAt = new Date();
  }
}
