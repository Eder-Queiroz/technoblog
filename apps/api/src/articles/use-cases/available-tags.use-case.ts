import {
  IAvailableTagsUseCase,
  ITagRepository,
  ITagsOutput,
  TagsOutput,
} from '@articles/shared';
import { Injectable, Provider } from '@nestjs/common';

@Injectable()
export class AvailableTagsUseCase implements IAvailableTagsUseCase {
  constructor(private readonly tagRepository: ITagRepository) {}

  async execute(): Promise<ITagsOutput[]> {
    const tags = await this.tagRepository.findAll();
    return tags.map(TagsOutput.fromEntity);
  }
}

export const AvailableTagsUseCaseProvider: Provider<IAvailableTagsUseCase> = {
  provide: IAvailableTagsUseCase,
  useClass: AvailableTagsUseCase,
};
