import { ApiProperty } from '@nestjs/swagger';
import { ITagsOutput, TagsOutput } from './tag-output.interface';
import { IArticleEntity } from '..';

export interface IArticleOutput {
  id: string;
  title: string;
  content: string;
  tags: ITagsOutput[];
}

export class ArticleOutput implements IArticleOutput {
  @ApiProperty({
    description: 'The article ID',
    type: String,
    example: '1',
  })
  id: string;

  @ApiProperty({
    description: 'The article title',
    type: String,
    example: 'Design system principles',
  })
  title: string;

  @ApiProperty({
    description: 'The article content',
    type: String,
    example:
      'The design system is a set of principles and guidelines for creating consistent and reusable UI components...',
  })
  content: string;

  @ApiProperty({
    description: 'The article tags',
    type: [TagsOutput],
  })
  tags: TagsOutput[];

  private constructor(props: IArticleOutput) {
    this.id = props.id;
    this.title = props.title;
    this.content = props.content;
    this.tags = props.tags.map(TagsOutput.fromEntity);
  }

  static fromEntity(entity: IArticleEntity): ArticleOutput {
    return new ArticleOutput({
      id: entity.id.toString(),
      title: entity.title,
      content: entity.content,
      tags:
        entity.articleTags
          ?.filter((articleTag) => articleTag.tag != null)
          .map((articleTag) => TagsOutput.fromEntity(articleTag.tag!)) ?? [],
    });
  }
}
