import { Inject } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { TransactionContext } from './transaction.context.ts';

export const PRISMA_SERVICE_KEY = Symbol('PRISMA_SERVICE');
export const TRANSACTION_CONTEXT_KEY = Symbol('TRANSACTION_CONTEXT');

export function Transactional(): MethodDecorator {
  const injectPrisma = Inject(PrismaService);
  const injectTransactionContext = Inject(TransactionContext);

  return (
    target: object,
    propertyKey: string | symbol,
    descriptor: PropertyDescriptor,
  ) => {
    injectPrisma(target, PRISMA_SERVICE_KEY);
    injectTransactionContext(target, TRANSACTION_CONTEXT_KEY);

    const originalMethod = descriptor.value;

    descriptor.value = async function (...args: any[]) {
      const prisma: PrismaService = this[PRISMA_SERVICE_KEY];
      const transactionContext: TransactionContext =
        this[TRANSACTION_CONTEXT_KEY];

      if (!prisma) {
        throw new Error(
          `@Transactional() requires PrismaService to be injected. ` +
            `Make sure the class is decorated with @Injectable() and has PrismaService in the module providers.`,
        );
      }

      if (!transactionContext) {
        throw new Error(
          `@Transactional() requires TransactionContext to be injected. ` +
            `Make sure TransactionContext is provided in the module.`,
        );
      }

      if (transactionContext.getClient()) {
        return originalMethod.apply(this, args);
      }

      return transactionContext.run(prisma, () =>
        originalMethod.apply(this, args),
      );
    };

    return descriptor;
  };
}
