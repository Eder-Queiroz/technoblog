import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsNotEmpty, IsNumber, IsPositive, Min } from 'class-validator';

export interface IPaginatedInput {
  page: number;
  limit: number;
}

export class PaginatedInput implements IPaginatedInput {
  @ApiProperty({
    description: 'The page number',
    example: 1,
  })
  @Type(() => Number)
  @IsNumber()
  @IsPositive()
  @Min(1)
  @IsNotEmpty()
  page: number;

  @ApiProperty({
    description: 'The limit number',
    example: 10,
  })
  @Type(() => Number)
  @IsNumber()
  @IsPositive()
  @Min(1)
  @IsNotEmpty()
  limit: number;
}
