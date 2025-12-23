import { BaseProps } from '@shared';
import { IAuthorEntityData } from '..';
import { IArticleTagEntityData } from './article-tag-entity.interface';

export interface IArticleEntityProps {
  title: string;
  authorId: bigint;
  content: string;
}

export interface IArticleRelations {
  author?: IAuthorEntityData;
  articleTags?: IArticleTagEntityData[];
}

export type IArticleEntityData = BaseProps<IArticleEntityProps> &
  IArticleRelations;

export type IArticleEntityPersistence = Omit<
  IArticleEntityData,
  keyof IArticleRelations
>;

export type IArticleEntityUpdateProps = Partial<
  Omit<IArticleEntityProps, 'authorId'>
>;

export interface IArticleEntity extends IArticleEntityData {
  toPersistence(): IArticleEntityPersistence;
  isAuthor(userId: bigint): boolean;
  delete(userId: bigint): void;
  update(props: IArticleEntityUpdateProps): void;
}
