import { ApiProperty } from '@nestjs/swagger';

export interface IAuthOutput {
  id: string;
  name: string;
  email: string;
  avatarUrl: string;
  accessToken: string;
}

export class AuthOutput implements IAuthOutput {
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

  @ApiProperty({
    description: 'JWT access token for authentication',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
  })
  accessToken: string;

  constructor(
    id: bigint,
    name: string,
    email: string,
    avatarUrl: string,
    accessToken: string,
  ) {
    this.id = id.toString();
    this.name = name;
    this.email = email;
    this.avatarUrl = avatarUrl;
    this.accessToken = accessToken;
  }
}
