export class ArticleDomainException extends Error {
  constructor(message: string) {
    super(message);
    this.name = ArticleDomainException.name;
  }
}

export class ArticleNotAuthorException extends ArticleDomainException {
  constructor() {
    super('Only the author can delete this article');
  }
}
