import { BaseProps, ToPersistence } from '@shared';
import { IArticleEntityData } from '..';
import { ITagEntityData } from './teg-entity.interface';

export interface IArticleTagEntityProps {
  articleId: bigint;
  tagId: number;
}

export interface IArticleTagRelations {
  article?: IArticleEntityData;
  tag?: ITagEntityData;
}

export type IArticleTagEntityData = BaseProps<IArticleTagEntityProps> &
  IArticleTagRelations;

export type IArticleTagEntityPersistence = ToPersistence<
  IArticleTagEntityData,
  IArticleTagRelations
>;

export interface IArticleTagEntity extends IArticleTagEntityData {
  toPersistence(): IArticleTagEntityPersistence;
  delete(): void;
}
