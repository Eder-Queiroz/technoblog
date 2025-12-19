import { BaseProps } from '../utils/base-props.type';

export interface IBaseUserEntityProps {
  googleId: string;
  email: string;
  fullName: string;
  avatarUrl: string;
}

export type IBaseUserEntityData = BaseProps<IBaseUserEntityProps>;
