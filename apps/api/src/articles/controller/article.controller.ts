import { IPostArticleUseCase, PostArticleInput } from '@articles/shared';
import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AuthGuard, CurrentUser, type IBaseUserEntityData } from '@shared';

@ApiTags('Articles')
@Controller('articles')
@UseGuards(AuthGuard)
export class ArticleController {
  constructor(private readonly postArticleUseCase: IPostArticleUseCase) {}

  @Post()
  async postArticle(
    @Body() dto: PostArticleInput,
    @CurrentUser() user: IBaseUserEntityData,
  ): Promise<void> {
    return this.postArticleUseCase.execute(dto, user.id);
  }
}
