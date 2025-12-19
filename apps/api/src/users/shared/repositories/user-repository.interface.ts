import { IUserEntity } from '../entities/user-entity.interface';

export abstract class IUserRepository {
  abstract findById(id: bigint): Promise<IUserEntity | null>;
  abstract upsert(user: IUserEntity): Promise<IUserEntity>;
}
