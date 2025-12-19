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

export interface IArticleEntity extends IArticleEntityData {
  toPersistence(): IArticleEntityPersistence;
}
