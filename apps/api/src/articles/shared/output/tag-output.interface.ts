import { ApiProperty } from '@nestjs/swagger';
import { ITagEntityData } from '..';

export interface ITagsOutput {
  id: number;
  name: string;
}

export class TagsOutput implements ITagsOutput {
  @ApiProperty({
    description: 'The tag ID',
    type: Number,
    example: 1,
  })
  id: number;

  @ApiProperty({
    description: 'The tag name',
    type: String,
    example: 'Backend',
  })
  name: string;

  private constructor(props: ITagsOutput) {
    this.id = props.id;
    this.name = props.name;
  }

  static fromEntity(entity: ITagEntityData): TagsOutput {
    return new TagsOutput({
      id: entity.id,
      name: entity.name,
    });
  }
}
