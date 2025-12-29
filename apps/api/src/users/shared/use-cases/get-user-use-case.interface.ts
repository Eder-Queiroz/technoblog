import { IUserOutput } from '../output/user-output.interface';

export abstract class IGetUserUseCase {
  abstract execute(userId: bigint): Promise<IUserOutput>;
}
