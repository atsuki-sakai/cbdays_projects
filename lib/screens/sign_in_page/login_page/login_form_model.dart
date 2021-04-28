class LoginFormModel {
  LoginFormModel({
    this.email = '',
    this.password = '',
    this.isSubmited = false,
    this.isLoading = false,
  });

  String email;
  String password;
  bool isSubmited;
  bool isLoading;

  bool get isEmailValid => email.isNotEmpty && email.contains('@') && email.length < 30;
  bool get isPasswordValid => password.length > 7 && password.length < 16;

  LoginFormModel copyWith({
    String? email,
    String? password,
    bool? isSubmited,
    bool? isLoading,
  }) {
    return LoginFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmited: isSubmited ?? this.isSubmited,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
