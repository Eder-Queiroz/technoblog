import { BaseProps, IBaseUserEntityProps, ToPersistence } from '@shared';

export type IUserEntityProps = IBaseUserEntityProps;

export type IUserEntityData = BaseProps<IBaseUserEntityProps>;

export type IUserEntityPersistence = ToPersistence<IUserEntityData>;

export interface IUserEntity extends IUserEntityData {
  toPersistence(): IUserEntityPersistence;
}
