import { IPaginatedOutput } from '@shared';
import { ArticleOutput, IArticleOutput } from './article-output.interface';
import { ApiProperty } from '@nestjs/swagger';

export type IPaginatedArticlesOutput = IPaginatedOutput<IArticleOutput>;

export class PaginatedArticlesOutput implements IPaginatedArticlesOutput {
  @ApiProperty({
    description: 'The list of articles',
    type: [ArticleOutput],
  })
  data: IArticleOutput[];
  @ApiProperty({
    description: 'The total number of articles',
    type: Number,
    example: 10,
  })
  total: number;

  constructor(props: IPaginatedArticlesOutput) {
    this.data = props.data;
    this.total = props.total;
  }
}
