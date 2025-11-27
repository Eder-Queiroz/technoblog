import { IUserEntity } from '../entities/user-entity.interface';

export abstract class IUserRepository {
  abstract findByGoogleId(googleId: string): Promise<IUserEntity | null>;
  abstract upsert(user: IUserEntity): Promise<IUserEntity>;
}
