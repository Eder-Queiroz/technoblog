import { Injectable, OnModuleDestroy, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from 'generated/prisma';
import {
  TransactionClient,
  TransactionContext,
} from './transaction.context.ts';

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  constructor(private readonly transactionContext: TransactionContext) {
    super();
  }

  async onModuleInit() {
    await this.$connect();
  }

  async onModuleDestroy() {
    await this.$disconnect();
  }

  getClient(): TransactionClient | PrismaClient {
    return this.transactionContext.getClient() ?? this;
  }
}
