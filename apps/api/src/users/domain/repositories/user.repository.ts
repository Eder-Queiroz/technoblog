import { PrismaService } from '@database';
import { Injectable, Provider } from '@nestjs/common';
import { IUserEntity, IUserRepository } from '@users/shared';
import { UserEntity } from '../entities/user.entity';

@Injectable()
export class UserRepository implements IUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByGoogleId(googleId: string): Promise<IUserEntity | null> {
    const user = await this.prisma.user.findUnique({
      where: {
        googleId,
      },
    });

    if (!user) {
      return null;
    }

    return UserEntity.restore(user);
  }

  async upsert(user: IUserEntity): Promise<IUserEntity> {
    const updatedUser = await this.prisma.user.upsert({
      where: {
        googleId: user.googleId,
      },
      update: user.toPersistence(),
      create: user.toPersistence(),
    });

    return UserEntity.restore(updatedUser);
  }
}

export const UserRepositoryProvider: Provider<IUserRepository> = {
  provide: IUserRepository,
  useClass: UserRepository,
};
