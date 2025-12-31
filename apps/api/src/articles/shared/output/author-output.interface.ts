import { ApiProperty } from '@nestjs/swagger';
import { IBaseUserEntityData } from '@shared';

export interface IAuthorOutput {
  id: string;
  name: string;
  email: string;
  avatarUrl: string;
}

export class AuthorOutput implements IAuthorOutput {
  @ApiProperty({
    description: 'The author ID',
    example: '1',
  })
  id: string;
  @ApiProperty({
    description: 'The author name',
    example: 'John Doe',
  })
  name: string;
  @ApiProperty({
    description: 'The author email',
    example: 'john.doe@example.com',
  })
  email: string;
  @ApiProperty({
    description: 'The author avatar URL',
    example: 'https://example.com/avatar.png',
  })
  avatarUrl: string;

  constructor(props: IAuthorOutput) {
    this.id = props.id;
    this.name = props.name;
    this.email = props.email;
    this.avatarUrl = props.avatarUrl;
  }

  static fromEntity(entity: IBaseUserEntityData): AuthorOutput {
    return new AuthorOutput({
      id: entity.id.toString(),
      name: entity.fullName,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
    });
  }
}
