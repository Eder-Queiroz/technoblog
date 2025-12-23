import {
  ValidationArguments,
  ValidationOptions,
  ValidatorConstraintInterface,
  registerDecorator,
} from 'class-validator';

export class IsBigIntConstraint implements ValidatorConstraintInterface {
  validate(
    value: any,
    _validationArguments?: ValidationArguments | undefined,
  ): boolean | Promise<boolean> {
    return typeof value === 'bigint';
  }

  defaultMessage(
    validationArguments?: ValidationArguments | undefined,
  ): string {
    return `${validationArguments?.property} must be a bigint`;
  }
}

export function IsBigInt(validationOptions?: ValidationOptions | undefined) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      constraints: [],
      validator: IsBigIntConstraint,
    });
  };
}
