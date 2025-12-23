import {
  IsArray,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export interface IUpdateArticleInput {
  title?: string;
  content?: string;
  tagIds: number[];
}

export class UpdateArticleInput implements IUpdateArticleInput {
  @IsString()
  @IsNotEmpty()
  @IsOptional()
  title?: string;

  @IsString()
  @IsNotEmpty()
  @IsOptional()
  content?: string;

  @IsArray()
  @IsNumber({}, { each: true })
  tagIds: number[];
}
