import { ITagsOutput } from '../output/tag-output.interface';

export abstract class IAvailableTagsUseCase {
  abstract execute(): Promise<ITagsOutput[]>;
}
