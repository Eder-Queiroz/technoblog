import { ITagEntity } from '..';

export abstract class ITagRepository {
  abstract findByIds(ids: number[]): Promise<ITagEntity[]>;
}
