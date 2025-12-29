import { Injectable, NotFoundException, Provider } from '@nestjs/common';
import {
  IGetUserUseCase,
  IUserOutput,
  IUserRepository,
  UserOutput,
} from '@users/shared';

@Injectable()
export class GetUserUseCase implements IGetUserUseCase {
  constructor(private readonly userRepository: IUserRepository) {}

  async execute(userId: bigint): Promise<IUserOutput> {
    const user = await this.userRepository.findById(userId);

    if (!user) {
      throw new NotFoundException('User not found');
    }

    return UserOutput.fromEntity(user);
  }
}

export const GetUserUseCaseProvider: Provider<IGetUserUseCase> = {
  provide: IGetUserUseCase,
  useClass: GetUserUseCase,
};
