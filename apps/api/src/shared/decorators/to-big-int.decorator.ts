/* eslint-disable @typescript-eslint/no-unsafe-argument */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { Transform } from 'class-transformer';

export function ToBigInt() {
  return Transform(({ value }) => {
    if (value === null || value === undefined || value === '') {
      return null;
    }

    if (typeof value === 'bigint') {
      return value;
    }

    try {
      return BigInt(value);
    } catch (error) {
      return value;
    }
  });
}
