import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export interface IAuthInput {
  idToken: string;
}

export class AuthInput implements IAuthInput {
  @ApiProperty({
    description: 'Google ID token for authentication',
    example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
    required: true,
  })
  @IsString()
  @IsNotEmpty()
  idToken: string;

  constructor(idToken: string) {
    this.idToken = idToken;
  }
}
