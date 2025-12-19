import { BaseProps, IBaseUserEntityProps } from '@shared';

export type IUserEntityProps = IBaseUserEntityProps;

export type IUserEntityData = BaseProps<IBaseUserEntityProps>;

export interface IUserEntity extends IUserEntityData {
  toPersistence(): IUserEntityData;
}
