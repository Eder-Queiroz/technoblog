export type BaseProps<T> = T & {
  id: bigint;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
};
