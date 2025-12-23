import {
  IDeleteArticleUseCase,
  IListArticlesUseCase,
  IPostArticleUseCase,
  IUpdateArticleUseCase,
  PaginatedArticleInput,
  PaginatedArticlesOutput,
  PostArticleInput,
  UpdateArticleInput,
} from '@articles/shared';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
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
import {
  AuthGuard,
  BigIntIdInput,
  CurrentUser,
  type IBaseUserEntityData,
} from '@shared';

@ApiTags('Articles')
@Controller('articles')
@UseGuards(AuthGuard)
export class ArticleController {
  constructor(
    private readonly postArticleUseCase: IPostArticleUseCase,
    private readonly listArticleUseCase: IListArticlesUseCase,
    private readonly deleteArticleUseCase: IDeleteArticleUseCase,
    private readonly updateArticleUseCase: IUpdateArticleUseCase,
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
    @Param() { id }: BigIntIdInput,
    @CurrentUser() user: IBaseUserEntityData,
  ): Promise<void> {
    return this.deleteArticleUseCase.execute(id, user.id);
  }

  @Patch(':id')
  @ApiBody({ type: UpdateArticleInput })
  async updateArticle(
    @Param() { id }: BigIntIdInput,
    @Body() dto: UpdateArticleInput,
    @CurrentUser() { id: userId }: IBaseUserEntityData,
  ): Promise<void> {
    return this.updateArticleUseCase.execute(id, userId, dto);
  }
}
