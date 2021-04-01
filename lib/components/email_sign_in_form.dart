import 'package:cbdyas_project/components/validators.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum EmailSignInFormType {
  signIn,
  register,
}

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  final emailFocusNode = FocusNode();
  final passWordFocusNode = FocusNode();

  String get _email => emailController.text;
  String get _pass => passwordController.text;

  void _emailEditingCompleted() {
    FocusScope.of(context).requestFocus(passWordFocusNode);
  }

  void _updateState() {
    setState(() {
      print("email => $_email");
      print("pass => $_pass");
    });
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
      emailController.clear();
      passwordController.clear();
    });
  }

  void _submit() {
    print('email => $_email');
    print('pass => $_pass');

    // TODO - Email Sign in
  }

  List<Widget> _buildContent() {
    final buttonText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Have an account?'
        : 'Already have an account?';
    bool isCompleted = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_pass);
    return [
      Text(
        'Sign in',
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 32.0,
      ),
      _buildEmailTextField(),
      SizedBox(
        height: 12.0,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 22.0,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
        ),
        onPressed: isCompleted ? _submit : null,
        child: Text(
          buttonText,
          style: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 32.0,
      ),
      TextButton(
        onPressed: _toggleFormType,
        child: Text(
          secondaryText,
          style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
        ),
      ),
    ];
  }

  TextField _buildPasswordTextField() {
    bool isPasswordValid = widget.passwordValidator.isValid(_pass);
    return TextField(
      focusNode: passWordFocusNode,
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'Password',
        errorText: isPasswordValid ? null : widget.invalidPasswordErrorText,
      ),
      controller: passwordController,
      autofocus: true,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    bool isEmailValid = widget.passwordValidator.isValid(_email);
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      focusNode: emailFocusNode,
      decoration: InputDecoration(
        hintText: 'email@sample.com',
        labelText: 'Email',
        errorText: isEmailValid ? null : widget.invalidEmailErrorText,
      ),
      controller: emailController,
      autofocus: true,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingCompleted,
      onChanged: (email) => _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildContent(),
      ),
    );
  }
}
