import { IAuthInput } from '../input/auth-input.interface';
import { AuthOutput } from '../output/auth-output.interface';

export abstract class IAuthUseCase {
  abstract execute(dto: IAuthInput): Promise<AuthOutput>;
}
