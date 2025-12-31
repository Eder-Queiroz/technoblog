import { ITagEntity } from '..';

export abstract class ITagRepository {
  abstract findAll(): Promise<ITagEntity[]>;
  abstract findByIds(ids: number[]): Promise<ITagEntity[]>;
}
