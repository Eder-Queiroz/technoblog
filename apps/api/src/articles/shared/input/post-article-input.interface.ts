import { ApiProperty } from '@nestjs/swagger';
import { IsArray, IsNotEmpty, IsNumber, IsString } from 'class-validator';

export interface IPostArticleInput {
  title: string;
  content: string;
  tagIds: number[];
}

export class PostArticleInput implements IPostArticleInput {
  @ApiProperty({
    description: 'The title of the article',
    example: 'Design system principles',
  })
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    description: 'The content of the article',
    example:
      'The design system is a set of principles and guidelines for creating consistent and reusable UI components...',
  })
  @IsString()
  @IsNotEmpty()
  content: string;

  @ApiProperty({
    description: 'The IDs of the tags for the article',
    example: [1, 2, 3],
  })
  @IsArray()
  @IsNumber({}, { each: true })
  @IsNotEmpty()
  tagIds: number[];

  constructor(props: IPostArticleInput) {
    this.title = props.title;
    this.content = props.content;
    this.tagIds = props.tagIds;
  }
}
