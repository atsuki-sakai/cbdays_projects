abstract class InputValidator {
  bool isStringValid(String value);
  bool isIntValid(int value);
}


class NonEmptyStringValidator implements InputValidator {
  @override
  bool isStringValid(String value) {
    return value.isNotEmpty;
  }
  bool isIntValid(int value) {
    return value > 0 && value != null;
  }
}

class InputFormValidators {
  final InputValidator emailValidator = NonEmptyStringValidator();
  final InputValidator passwordValidator = NonEmptyStringValidator();
  final InputValidator surNameValidator = NonEmptyStringValidator();
  final InputValidator surNameFuriganaValidator = NonEmptyStringValidator();
  final InputValidator lastNameValidator = NonEmptyStringValidator();
  final InputValidator lastNameFuriganaValidator = NonEmptyStringValidator();
  final InputValidator callNumberValidator = NonEmptyStringValidator();
  final InputValidator birthYearValidator = NonEmptyStringValidator();
  final InputValidator birthMonthValidator = NonEmptyStringValidator();
  final InputValidator birthDayValidator = NonEmptyStringValidator();
  final InputValidator haveChildrenVaildator = NonEmptyStringValidator();

  final String emailErrorText = "メールアドレスは必須項目です。";
  final String passwordErrorText = "パスワードは必須項目です。";
  final String surNameErrorText = "名前は必須項目です。";
  final String surNameFuriganaErrorText = "名前(カタカナ)は必須項目です。";
  final String lastNameErrorText = "苗字は必須項目です。";
  final String lastNameFuriganaErrorText = "苗字(カタカナ)は必須項目です。";
  final String callNumberErrorText = "**数字のみで入　市外局番無し**";
  final String birthYearErrorText = "**数字のみで入力**";
  final String birthMonthErrorText = "**数字のみで入力**";
  final String birthDayErrorText = "**数字のみで入力**";
  final String haveChildrenErrorText = "**数字のみで入力**";

}
