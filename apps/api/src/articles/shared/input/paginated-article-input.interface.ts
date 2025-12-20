import { ApiProperty } from '@nestjs/swagger';
import { IPaginatedInput, PaginatedInput } from '@shared';
import { Transform } from 'class-transformer';
import { IsArray, IsNumber, IsOptional, IsString } from 'class-validator';

export interface IPaginatedArticleInput extends IPaginatedInput {
  search?: string;
  tagIds?: number[];
}

export class PaginatedArticleInput
  extends PaginatedInput
  implements IPaginatedArticleInput
{
  @ApiProperty({
    description: 'The search query',
    example: 'design system',
  })
  @IsString()
  @IsOptional()
  search?: string;

  @ApiProperty({
    description: 'The IDs of the tags',
    example: [1, 2, 3],
  })
  @IsOptional()
  @Transform(({ value }) => {
    if (value === undefined || value === null || value === '') {
      return undefined;
    }

    return value.split(',').map(Number);
  })
  @IsArray()
  @IsNumber({}, { each: true })
  tagIds?: number[];
}
