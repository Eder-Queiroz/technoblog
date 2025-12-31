import { BaseProps, ToPersistence } from '@shared';
import { IArticleTagEntityData } from './article-tag-entity.interface';

export interface ITagEntityProps {
  name: string;
}

export interface ITagRelations {
  articleTags?: IArticleTagEntityData[];
}

export type ITagEntityData = Omit<BaseProps<ITagEntityProps>, 'id'> &
  ITagRelations & { id: number };

export type ITagEntityPersistence = ToPersistence<
  ITagEntityData,
  ITagRelations
>;

export interface ITagEntity extends ITagEntityData {
  toPersistence(): ITagEntityPersistence;
}
