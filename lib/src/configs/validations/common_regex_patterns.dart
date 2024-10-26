class RegexPatterns {
  static const emailPattern =
      r'^[a-zA-Z0-9]+[\w\.-]*(\+[a-zA-Z0-9]+)?@[a-zA-Z0-9]([\w-]+\.)+[\w-]{2,4}$';
  static const alphabetsPattern = r'^(?:[a-zA-Z]+(?: [a-zA-Z]+)*)?$';
  static const alphanumericRegExp = r'^[a-zA-Z0-9]+$';
  static const phoneNumberPattern = r'^[^+]*$';
  static const passwordPattern =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z\d\s])[A-Za-z\d\S]{8,}$';
  static const dateOfBirthPattern =
      r'^(0[1-9]|1[0-2])/(0[1-9]|[12]\d|3[01])/(\d{4})$';
}
