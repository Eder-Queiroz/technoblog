import { IsNotEmpty } from 'class-validator';
import { IsBigInt } from '../decorators/is-big-int.decorator';
import { ToBigInt } from '../decorators/to-big-int.decorator';

export interface IBigIntIdInput {
  id: bigint;
}

export class BigIntIdInput implements IBigIntIdInput {
  @IsNotEmpty()
  @IsBigInt()
  @ToBigInt()
  id: bigint;
}
