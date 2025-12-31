export type BaseProps<T> = T & {
  id: bigint;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
};

export type ToPersistence<T, Relations = object> = Omit<
  T,
  keyof Relations | 'id' | 'createdAt' | 'updatedAt' | 'deletedAt'
>;
