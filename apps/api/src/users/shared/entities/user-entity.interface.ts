import { BaseProps } from '@shared/utils/base-props.type';

export interface IUserEntityProps {
  googleId: string;
  email: string;
  fullName: string;
  avatarUrl: string;
}

export type IUserEntityData = BaseProps<IUserEntityProps>;

export interface IUserEntity extends IUserEntityData {
  toPersistence(): IUserEntityData;
}
