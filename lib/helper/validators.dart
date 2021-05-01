abstract class StringValidator {
  bool isStringValid(String value);
}


class NonEmptyStringValidator implements StringValidator {
  @override
  bool isStringValid(String value) {
    return value.isNotEmpty;
  }
}

class InputFormValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator surNameValidator = NonEmptyStringValidator();
  final StringValidator surNameFuriganaValidator = NonEmptyStringValidator();
  final StringValidator lastNameValidator = NonEmptyStringValidator();
  final StringValidator lastNameFuriganaValidator = NonEmptyStringValidator();
  final StringValidator callNumberValidator = NonEmptyStringValidator();
  final StringValidator birthYearValidator = NonEmptyStringValidator();
  final StringValidator birthMonthValidator = NonEmptyStringValidator();
  final StringValidator birthDayValidator = NonEmptyStringValidator();
  final StringValidator haveChildrenVaildator = NonEmptyStringValidator();

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
