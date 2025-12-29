import { ApiProperty } from '@nestjs/swagger';
import { IUserEntity } from '../entities/user-entity.interface';

export interface IUserOutput {
  id: string;
  name: string;
  email: string;
  avatarUrl: string;
}

export class UserOutput implements IUserOutput {
  @ApiProperty({
    description: 'User ID',
    example: '1234567890',
  })
  id: string;

  @ApiProperty({
    description: 'User name',
    example: 'John Doe',
  })
  name: string;

  @ApiProperty({
    description: 'User email',
    example: 'john.doe@example.com',
  })
  email: string;

  @ApiProperty({
    description: 'User avatar URL',
    example: 'https://example.com/avatar.png',
  })
  avatarUrl: string;

  constructor(id: bigint, name: string, email: string, avatarUrl: string) {
    this.id = id.toString();
    this.name = name;
    this.email = email;
    this.avatarUrl = avatarUrl;
  }

  static fromEntity(entity: IUserEntity): UserOutput {
    return new UserOutput(
      entity.id,
      entity.fullName,
      entity.email,
      entity.avatarUrl,
    );
  }
}
