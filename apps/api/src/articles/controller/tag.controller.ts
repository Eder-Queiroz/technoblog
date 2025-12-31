import { Controller, Get, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@shared';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { IAvailableTagsUseCase, TagsOutput } from '@articles/shared';

@ApiTags('Tags')
@Controller('tags')
@UseGuards(AuthGuard)
export class TagController {
  constructor(private readonly availableTagsUseCase: IAvailableTagsUseCase) {}

  @Get()
  @ApiOperation({ summary: 'Get available tags to filter articles' })
  @ApiResponse({
    status: 200,
    description: 'Available tags to filter articles',
    isArray: true,
    type: TagsOutput,
  })
  async availableTags(): Promise<TagsOutput[]> {
    return this.availableTagsUseCase.execute();
  }
}
