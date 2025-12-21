import {
  ArticleNotAuthorException,
  IArticleEntity,
  IArticleEntityData,
  IArticleEntityPersistence,
  IArticleEntityProps,
} from '@articles/shared';
import { AuthorEntity } from './author.entity';
import { ArticleTagEntity } from './article-tag.entity';

export class ArticleEntity implements IArticleEntity {
  id: bigint;
  title: string;
  authorId: bigint;
  content: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
  author?: AuthorEntity;
  articleTags?: ArticleTagEntity[];

  private constructor(private readonly props: IArticleEntityData) {
    this.id = props.id;
    this.title = props.title;
    this.authorId = props.authorId;
    this.content = props.content;
    this.createdAt = props.createdAt;
    this.updatedAt = props.updatedAt;
    this.deletedAt = props.deletedAt;
    this.author = props.author ? AuthorEntity.restore(props.author) : undefined;
    this.articleTags =
      props.articleTags?.map((articleTag) =>
        ArticleTagEntity.restore(articleTag),
      ) ?? undefined;
  }

  static create(props: IArticleEntityProps): ArticleEntity {
    return new ArticleEntity({
      ...props,
      id: 0n,
      createdAt: new Date(),
      updatedAt: new Date(),
      deletedAt: null,
    });
  }

  static restore(props: IArticleEntityData): ArticleEntity {
    return new ArticleEntity(props);
  }

  toPersistence(): IArticleEntityPersistence {
    return {
      id: this.id,
      title: this.title,
      authorId: this.authorId,
      content: this.content,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      deletedAt: this.deletedAt,
    };
  }

  private isAuthor(userId: bigint): boolean {
    return this.authorId === userId;
  }

  delete(userId: bigint): void {
    if (!this.isAuthor(userId)) {
      throw new ArticleNotAuthorException();
    }
    this.deletedAt = new Date();
  }
}
