import { Body, Controller, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AuthInput, AuthOutput, IAuthUseCase } from '@users/shared';

@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authUseCase: IAuthUseCase) {}

  @Post()
  async auth(@Body() dto: AuthInput): Promise<AuthOutput> {
    return this.authUseCase.execute(dto);
  }
}
