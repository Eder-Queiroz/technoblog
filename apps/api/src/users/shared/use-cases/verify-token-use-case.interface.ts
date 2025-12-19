import { IBaseUserEntityData } from '@shared';

export abstract class IVerifyTokenUseCase {
  abstract execute(token: string): Promise<IBaseUserEntityData>;
}
