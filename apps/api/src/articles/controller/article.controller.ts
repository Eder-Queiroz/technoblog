import {
  IListArticlesUseCase,
  IPostArticleUseCase,
  PaginatedArticleInput,
  PaginatedArticlesOutput,
  PostArticleInput,
} from '@articles/shared';
import { Body, Controller, Get, Post, Query, UseGuards } from '@nestjs/common';
import {
  ApiBody,
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
}
