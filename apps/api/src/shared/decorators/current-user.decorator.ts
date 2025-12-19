import { ExecutionContext, createParamDecorator } from '@nestjs/common';
import { IBaseUserEntityData } from '../entities/user-entity.interface';

export const CurrentUser = createParamDecorator(
  (data: keyof IBaseUserEntityData | undefined, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();

    const user = request.user as IBaseUserEntityData;

    return data ? user?.[data] : user;
  },
);
