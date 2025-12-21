import {
  IDeleteArticleUseCase,
  IListArticlesUseCase,
  IPostArticleUseCase,
  PaginatedArticleInput,
  PaginatedArticlesOutput,
  PostArticleInput,
} from '@articles/shared';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Query,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBody,
  ApiForbiddenResponse,
  ApiNotFoundResponse,
  ApiOperation,
  ApiQuery,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { AuthGuard, CurrentUser, type IBaseUserEntityData } from '@shared';

@ApiTags('Articles')
@Controller('articles')
@UseGuards(AuthGuard)
export class ArticleController {
  constructor(
    private readonly postArticleUseCase: IPostArticleUseCase,
    private readonly listArticleUseCase: IListArticlesUseCase,
    private readonly deleteArticleUseCase: IDeleteArticleUseCase,
  ) {}

  @Post()
  @ApiBody({ type: PostArticleInput })
  @ApiResponse({ status: 201, description: 'Article posted successfully' })
  @ApiNotFoundResponse({ description: 'Some tags do not exist' })
  @ApiOperation({
    summary: 'Post article',
    description: 'Post a new article',
  })
  async postArticle(
    @Body() dto: PostArticleInput,
    @CurrentUser() user: IBaseUserEntityData,
  ): Promise<void> {
    return this.postArticleUseCase.execute(dto, user.id);
  }

  @Get()
  @ApiQuery({ type: PaginatedArticleInput })
  @ApiResponse({ type: PaginatedArticlesOutput })
  @ApiOperation({
    summary: 'List articles',
    description: 'List articles with pagination',
  })
  async listArticles(
    @Query() query: PaginatedArticleInput,
  ): Promise<PaginatedArticlesOutput> {
    return this.listArticleUseCase.execute(query);
  }

  @Delete(':id')
  @ApiOperation({
    summary: 'Delete article',
    description: 'Delete an article',
  })
  @ApiNotFoundResponse({ description: 'Article not found' })
  @ApiForbiddenResponse({
    description: 'Only the author can delete this article',
  })
  async deleteArticle(
    @Param('id') id: number,
    @CurrentUser() user: IBaseUserEntityData,
  ): Promise<void> {
    return this.deleteArticleUseCase.execute(id, user.id);
  }
}
