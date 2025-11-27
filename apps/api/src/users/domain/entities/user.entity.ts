import { IUserEntity, IUserEntityData, IUserEntityProps } from '@users/shared';

export class UserEntity implements IUserEntity {
  id: bigint;
  googleId: string;
  email: string;
  fullName: string;
  avatarUrl: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;

  private constructor(private readonly props: IUserEntityData) {
    this.id = props.id;
    this.googleId = props.googleId;
    this.email = props.email;
    this.fullName = props.fullName;
    this.avatarUrl = props.avatarUrl;
    this.createdAt = props.createdAt;
    this.updatedAt = props.updatedAt;
    this.deletedAt = props.deletedAt;
  }

  static create(props: IUserEntityProps): UserEntity {
    return new UserEntity({
      ...props,
      id: 0n,
      createdAt: new Date(),
      updatedAt: new Date(),
      deletedAt: null,
    });
  }

  static restore(props: IUserEntityData): UserEntity {
    return new UserEntity(props);
  }

  toPersistence(): IUserEntityData {
    return {
      id: this.id,
      googleId: this.googleId,
      email: this.email,
      fullName: this.fullName,
      avatarUrl: this.avatarUrl,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      deletedAt: this.deletedAt,
    };
  }
}
