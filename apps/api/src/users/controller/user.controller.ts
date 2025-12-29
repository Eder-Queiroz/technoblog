import { Controller, Get, UseGuards } from '@nestjs/common';
import {
  ApiNotFoundResponse,
  ApiOperation,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { AuthGuard, CurrentUser, type IBaseUserEntityData } from '@shared';
import { IGetUserUseCase, UserOutput } from '@users/shared';

@ApiTags('Users')
@Controller('user')
@UseGuards(AuthGuard)
export class UserController {
  constructor(private readonly getUserUseCase: IGetUserUseCase) {}

  @Get('me')
  @ApiOperation({ summary: 'Get current user information' })
  @ApiResponse({
    status: 200,
    description: 'User information',
    type: UserOutput,
  })
  @ApiNotFoundResponse({
    description: 'User not found',
  })
  async getUser(@CurrentUser() user: IBaseUserEntityData): Promise<UserOutput> {
    return this.getUserUseCase.execute(user.id);
  }
}
