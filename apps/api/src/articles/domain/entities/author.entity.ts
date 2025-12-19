import { IAuthorEntityData } from '@articles/shared';

export class AuthorEntity implements IAuthorEntityData {
  id: bigint;
  googleId: string;
  email: string;
  fullName: string;
  avatarUrl: string;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;

  private constructor(private readonly props: IAuthorEntityData) {
    this.id = props.id;
    this.googleId = props.googleId;
    this.email = props.email;
    this.fullName = props.fullName;
    this.avatarUrl = props.avatarUrl;
    this.createdAt = props.createdAt;
    this.updatedAt = props.updatedAt;
    this.deletedAt = props.deletedAt;
  }

  static restore(props: IAuthorEntityData): AuthorEntity {
    return new AuthorEntity(props);
  }
}
