BigInt bigIntFromJson(dynamic value) {
  if (value is String) {
    return BigInt.parse(value);
  } else if (value is int) {
    return BigInt.from(value);
  }

  return BigInt.zero;
}

String bigIntToJson(BigInt value) {
  return value.toString();
}
