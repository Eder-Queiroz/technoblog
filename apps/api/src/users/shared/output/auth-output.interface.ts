import { ApiProperty } from '@nestjs/swagger';

export interface IAuthOutput {
  accessToken: string;
}

export class AuthOutput implements IAuthOutput {
  @ApiProperty({
    description: 'JWT access token for authentication',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
  })
  accessToken: string;

  constructor(accessToken: string) {
    this.accessToken = accessToken;
  }
}
