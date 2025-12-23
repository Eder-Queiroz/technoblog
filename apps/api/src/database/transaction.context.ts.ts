import { Injectable } from '@nestjs/common';
import { PrismaClient } from 'generated/prisma';
import { AsyncLocalStorage } from 'async_hooks';

export type TransactionClient = Omit<
  PrismaClient,
  '$connect' | '$disconnect' | '$on' | '$transaction' | '$use' | '$extends'
>;

@Injectable()
export class TransactionContext {
  private readonly storage = new AsyncLocalStorage<TransactionClient>();

  getClient(): TransactionClient | undefined {
    return this.storage.getStore();
  }

  async run<T>(prisma: PrismaClient, callback: () => Promise<T>): Promise<T> {
    return prisma.$transaction(async (tx: TransactionClient) => {
      return this.storage.run(tx, callback);
    });
  }
}
