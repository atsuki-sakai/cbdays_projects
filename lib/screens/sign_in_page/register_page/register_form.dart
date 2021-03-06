import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:cbdyas_project/helper/validators.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_bloc.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum EmailSignInFormType {
  signIn,
  register,
}

class RegisterForm extends StatelessWidget {
  final Auth auth;

  const RegisterForm({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
        mobileView: MobileRegisterForm.create(context, auth: auth),
        tableView: MobileRegisterForm.create(context, auth: auth),
        desktopView: DeskTopRegisterForm.create(context, auth: auth));
  }
}

class DeskTopRegisterForm extends StatefulWidget {
  const DeskTopRegisterForm({Key? key, required this.auth, required this.bloc})
      : super(key: key);
  final Auth auth;
  final RegisterBloc bloc;

  static Widget create(BuildContext context, {required Auth auth}) {
    return Provider<RegisterBloc>(
      create: (_) => RegisterBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<RegisterBloc>(builder: (_, bloc, __) {
        return DeskTopRegisterForm(auth: auth, bloc: bloc);
      }),
    );
  }

  @override
  _DeskTopRegisterFormState createState() => _DeskTopRegisterFormState();
}

class _DeskTopRegisterFormState extends State<DeskTopRegisterForm>
    with InputFormValidators {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _surNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _surNameFuriganaController = TextEditingController();
  final _lastNameFuriganaController = TextEditingController();
  final _callNumberController = TextEditingController();
  final _birthYearController = TextEditingController();
  final _birthMonthController = TextEditingController();
  final _birthDayController = TextEditingController();
  final _withSpouceController = TextEditingController();
  final _numberOfChildrenController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passWordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _surNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _surNameFuriganaFocusNode = FocusNode();
  final _lastNameFriganaFocusNode = FocusNode();
  final _callNumberFocusNode = FocusNode();
  final _birthYearFocusNode = FocusNode();
  final _birthMonthFocusNode = FocusNode();
  final _birthDayFocusNode = FocusNode();
  final _withSpouceFocusNode = FocusNode();
  final _numberOfChildrenFocusNode = FocusNode();

  Future<void> _submit() async {
    try {
      await widget.bloc.submit();
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('????????????'),
              content: Text('????????????????????????????????????????????????????????????????????????????????????'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
      Navigator.pop(context);
    } on CustomException catch (e) {
      print(e);
      // FIXME - ????????????????????????????????? showAlert?????????????????????????????????????????????????????????
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  '???????????????',
                  style: GoogleFonts.notoSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  '??????????????????????????????????????????????????????????????????????????????${e.message}',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _surNameController.dispose();
    _lastNameController.dispose();
    _callNumberController.dispose();
    _birthYearController.dispose();
    _birthMonthController.dispose();
    _birthDayController.dispose();
    _withSpouceController.dispose();
    _numberOfChildrenController.dispose();

    _emailFocusNode.dispose();
    _passWordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _surNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _callNumberFocusNode.dispose();
    _birthYearFocusNode.dispose();
    _birthMonthFocusNode.dispose();
    _birthDayFocusNode.dispose();
    _withSpouceFocusNode.dispose();
    _numberOfChildrenFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentPadding = 22.0;
    return StreamBuilder<RegisterModel>(
        stream: widget.bloc.modelStream,
        builder: (context, snapshot) {
          final model = snapshot.data;
          if (model == null) return Center(child: CircularProgressIndicator());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailAndPasswordField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildUserNameField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildCallNumberField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildBirthDayField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildIsSpouceField(model: model),
              if (model.isSpouce) ...{
                SizedBox(
                  height: contentPadding,
                ),
                _buildHaveChildrenField(model: model),
              },
              SizedBox(
                height: 64,
              ),
              _buildRegisterButton(),
              SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  '????????????????????????????????????????????????????????????',
                  style:
                      GoogleFonts.montserrat(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () async {
          await _submit();
        },
        child: Text(
          '?????????????????????',
          style: GoogleFonts.sawarabiGothic(
              fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
      ),
    );
  }

  // TODO - FIXME ?????????????????????????????????????????? ????????????????????????????????????StreamBuilder??????????????????ReBuild????????????
  Card _buildHaveChildrenField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '??? ???????????????',
              style: GoogleFonts.notoSans(
                  fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 80,
            ),
            Icon(
              Icons.child_care,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 140, child: _haveChildredField(model: model))
          ],
        ),
      ),
    );
  }

  Card _buildIsSpouceField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '??? ??????????????????',
                style: GoogleFonts.notoSans(
                    fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 120,
            ),
            Icon(
              Icons.supervisor_account,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              model.isSpouce ? '???????????????' : '???????????????',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Icon(
              model.isSpouce ? Icons.check_circle : Icons.not_interested,
              color: model.isSpouce ? Colors.blue.shade700 : Colors.grey,
              size: 40,
            ),
            SizedBox(
              width: 22,
            ),
            Switch(
              value: model.isSpouce,
              onChanged: widget.bloc.updateIsSpouce,
            )
          ],
        ),
      ),
    );
  }

  Card _buildBirthDayField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: GoogleFonts.notoSans(
                  fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 80,
            ),
            Icon(
              Icons.outlined_flag,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 140, child: _birthYearField(model: model)),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 140, child: _birthMonthField(model: model)),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 140, child: _birthDayField(model: model)),
          ],
        ),
      ),
    );
  }

  Card _buildCallNumberField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: GoogleFonts.notoSans(
                  fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 80,
            ),
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(width: 300, child: _callNumberField(model: model)),
          ],
        ),
      ),
    );
  }

  Card _buildUserNameField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: GoogleFonts.notoSans(
                  fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _lastNameField(model: model),
                ),
                Spacer(),
                Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _surNameTextField(model: model),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.create_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _lastNameFuriganaField(model: model),
                ),
                Spacer(),
                Icon(
                  Icons.create_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _surNameFuriganaNameField(model: model),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildEmailAndPasswordField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????????????? & ???????????????',
              style: titleStyle(),
            ),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(width: 300, child: _buildEmailTextField(model: model)),
                Spacer(),
                Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _buildPasswordTextField(model: model),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 300,
                  child: _buildConfirmPasswordTextField(model: model),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildPasswordTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: _passWordFocusNode,
      decoration: InputDecoration(
        hintText: '(7???????????????16????????????)',
        labelText: '???????????????',
        errorText: model.passwordValid ? passwordErrorText : null,
      ),
      controller: _passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => widget.bloc.updatePassword(password),
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
      // onEditingComplete: _submit,
    );
  }

  TextField _buildConfirmPasswordTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: _confirmPasswordFocusNode,
      decoration: InputDecoration(
        hintText: '* ????????????????????????????????? *',
        labelText: '????????????????????????',
        errorText: model.passwordValid ? passwordErrorText : null,
      ),
      controller: _confirmPasswordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => widget.bloc.updateConfirmPassword(password),
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_lastNameFocusNode),
      // onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        hintText: 'email@sample.com',
        labelText: '?????????????????????',
        errorText: model.emailValid ? emailErrorText : null,
      ),
      controller: _emailController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passWordFocusNode),
      onChanged: (email) => widget.bloc.updateEmail(email),
    );
  }

  TextField _surNameTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _surNameFocusNode,
      decoration: InputDecoration(
        hintText: '??????',
        labelText: '??????',
        errorText: model.surNameValid ? surNameErrorText : null,
      ),
      controller: _surNameController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_lastNameFriganaFocusNode),
      onChanged: (surName) => widget.bloc.updateSurName(surName),
    );
  }

  TextField _lastNameField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _lastNameFocusNode,
      decoration: InputDecoration(
        hintText: '??????',
        labelText: '??????',
        errorText: model.lastNameValid ? lastNameErrorText : null,
      ),
      controller: _lastNameController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_surNameFocusNode),
      onChanged: (lastName) => widget.bloc.updateLastName(lastName),
    );
  }

  TextField _surNameFuriganaNameField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _surNameFuriganaFocusNode,
      decoration: InputDecoration(
        hintText: '?????????',
        labelText: '????????????????????????',
        errorText: model.surNameFuriganaValid ? surNameFuriganaErrorText : null,
      ),
      controller: _surNameFuriganaController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_callNumberFocusNode),
      onChanged: (surNameF) => widget.bloc.updateSurNameFurigana(surNameF),
    );
  }

  TextField _lastNameFuriganaField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _lastNameFriganaFocusNode,
      decoration: InputDecoration(
        hintText: '?????????',
        labelText: '??????(????????????)',
        errorText: model.lastNameFuriganaValid ? lastNameErrorText : null,
      ),
      controller: _lastNameFuriganaController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_surNameFuriganaFocusNode),
      onChanged: (lastNameF) => widget.bloc.updateLastNameFurigana(lastNameF),
    );
  }

  TextField _callNumberField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _callNumberFocusNode,
      decoration: InputDecoration(
        hintText: '??????07955972139(?????????????????????)',
        labelText: '????????????',
        errorText: model.callNumberValid ? callNumberErrorText : null,
      ),
      controller: _callNumberController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthYearFocusNode),
      onChanged: (callNumber) => widget.bloc.updateCallNumber(callNumber),
    );
  }

  TextField _birthYearField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthYearFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 1993',
        labelText: '???',
        errorText: model.birthYearValid ? birthYearErrorText : null,
      ),
      controller: _birthYearController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthMonthFocusNode),
      onChanged: (year) => widget.bloc.updateBirthYear(year),
    );
  }

  TextField _birthMonthField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthMonthFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 04',
        labelText: '???',
        errorText: model.birthMonthValid ? birthMonthErrorText : null,
      ),
      controller: _birthMonthController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthDayFocusNode),
      onChanged: (month) => widget.bloc.updateBirthMonth(month),
    );
  }

  TextField _birthDayField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthDayFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 21',
        labelText: '???',
        errorText: model.birthDayValid ? birthDayErrorText : null,
      ),
      controller: _birthDayController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_withSpouceFocusNode),
      onChanged: (day) => widget.bloc.updateBirthDay(day),
    );
  }

  Widget _isSpouceSwitch({required RegisterModel model}) {
    final icon = model.isSpouce
        ? Icons.check_circle_outline
        : Icons.not_interested_outlined;
    final color = model.isSpouce ? Colors.green.shade300 : Colors.grey;
    return Row(
      children: [
        Icon(icon, color: color),
        Text('??????????????????'),
        Spacer(),
        Switch(
          focusNode: _withSpouceFocusNode,
          value: model.isSpouce,
          onChanged: widget.bloc.updateIsSpouce,
        ),
      ],
    );
  }

  TextField _haveChildredField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _numberOfChildrenFocusNode,
      decoration: InputDecoration(
        hintText: '(????????????)',
        labelText: '???????????????',
        errorText: model.haveChildValid ? haveChildrenErrorText : null,
      ),
      controller: _numberOfChildrenController,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      onChanged: (haveChildren) => widget.bloc.updateHaveChildren(haveChildren),
    );
  }

  TextStyle titleStyle() {
    return GoogleFonts.notoSans(fontSize: 20.0, fontWeight: FontWeight.w400);
  }
}

// FIXME - refactor

class MobileRegisterForm extends StatefulWidget {
  const MobileRegisterForm({Key? key, required this.auth, required this.bloc})
      : super(key: key);
  final Auth auth;
  final RegisterBloc bloc;

  static Widget create(BuildContext context, {required Auth auth}) {
    return Provider<RegisterBloc>(
      create: (_) => RegisterBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<RegisterBloc>(builder: (_, bloc, __) {
        return MobileRegisterForm(auth: auth, bloc: bloc);
      }),
    );
  }

  @override
  _MobileRegisterFormState createState() => _MobileRegisterFormState();
}

class _MobileRegisterFormState extends State<MobileRegisterForm>
    with InputFormValidators {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _surNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _surNameFuriganaController = TextEditingController();
  final _lastNameFuriganaController = TextEditingController();
  final _callNumberController = TextEditingController();
  final _birthYearController = TextEditingController();
  final _birthMonthController = TextEditingController();
  final _birthDayController = TextEditingController();
  final _withSpouceController = TextEditingController();
  final _numberOfChildrenController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passWordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _surNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _surNameFuriganaFocusNode = FocusNode();
  final _lastNameFriganaFocusNode = FocusNode();
  final _callNumberFocusNode = FocusNode();
  final _birthYearFocusNode = FocusNode();
  final _birthMonthFocusNode = FocusNode();
  final _birthDayFocusNode = FocusNode();
  final _withSpouceFocusNode = FocusNode();
  final _numberOfChildrenFocusNode = FocusNode();

  Future<void> _submit() async {
    try {
      await widget.bloc.submit();
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('????????????'),
              content: Text('????????????????????????????????????????????????????????????????????????????????????'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
      Navigator.pop(context);
    } on CustomException catch (e) {
      print(e);
      // FIXME - ????????????????????????????????? showAlert?????????????????????????????????????????????????????????
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  '???????????????',
                  style: GoogleFonts.notoSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  '??????????????????????????????????????????????????????????????????????????????${e.message}',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _surNameController.dispose();
    _lastNameController.dispose();
    _callNumberController.dispose();
    _birthYearController.dispose();
    _birthMonthController.dispose();
    _birthDayController.dispose();
    _withSpouceController.dispose();
    _numberOfChildrenController.dispose();

    _emailFocusNode.dispose();
    _passWordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _surNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _callNumberFocusNode.dispose();
    _birthYearFocusNode.dispose();
    _birthMonthFocusNode.dispose();
    _birthDayFocusNode.dispose();
    _withSpouceFocusNode.dispose();
    _numberOfChildrenFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentPadding = 22.0;
    return StreamBuilder<RegisterModel>(
        stream: widget.bloc.modelStream,
        builder: (context, snapshot) {
          final model = snapshot.data;
          if (model == null) return Center(child: CircularProgressIndicator());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmailAndPasswordField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildUserNameField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildCallNumberField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildBirthDayField(model: model),
              SizedBox(
                height: contentPadding,
              ),
              _buildIsSpouceField(model: model),
              if (model.isSpouce) ...{
                SizedBox(
                  height: contentPadding,
                ),
                _buildHaveChildrenField(model: model),
              },
              SizedBox(
                height: 64,
              ),
              _buildRegisterButton(),
              SizedBox(
                height: 32,
              ),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    '????????????????????????????????????????????????????????????',
                    style: GoogleFonts.montserrat(
                        color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await _submit();
        },
        child: Text(
          '?????????????????????',
          style: GoogleFonts.sawarabiGothic(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 2),
        ),
      ),
    );
  }

  // TODO - FIXME ?????????????????????????????????????????? ????????????????????????????????????StreamBuilder??????????????????ReBuild????????????
  Card _buildHaveChildrenField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ???????????????',
              style: titleStyle(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.child_care,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: _haveChildredField(model: model)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildIsSpouceField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ??????????????????',
              style: GoogleFonts.notoSans(
                  fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Spacer(),
                Icon(
                  Icons.supervisor_account,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  model.isSpouce ? '???????????????' : '???????????????',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Icon(
                  model.isSpouce ? Icons.check_circle : Icons.not_interested,
                  color: model.isSpouce ? Colors.blue.shade700 : Colors.grey,
                  size: 40,
                ),
                SizedBox(
                  width: 22,
                ),
                Switch(
                  value: model.isSpouce,
                  onChanged: widget.bloc.updateIsSpouce,
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildBirthDayField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: titleStyle(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.outlined_flag,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(flex: 2, child: _birthYearField(model: model)),
                SizedBox(
                  width: 12,
                ),
                Expanded(flex: 1, child: _birthMonthField(model: model)),
                SizedBox(
                  width: 12,
                ),
                Expanded(flex: 1, child: _birthDayField(model: model)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildCallNumberField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: titleStyle(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.call,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: _callNumberField(model: model)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildUserNameField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????',
              style: titleStyle(),
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: _lastNameField(model: model)),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _surNameTextField(model: model),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.create_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _lastNameFuriganaField(model: model),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _surNameFuriganaNameField(model: model),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _buildEmailAndPasswordField({required RegisterModel model}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '??? ????????????????????? & ???????????????',
              style: titleStyle(),
            ),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: _buildEmailTextField(model: model)),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _buildPasswordTextField(model: model),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _buildConfirmPasswordTextField(model: model),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildPasswordTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: _passWordFocusNode,
      decoration: InputDecoration(
        hintText: '(7???????????????16????????????)',
        labelText: '???????????????',
        errorText: model.passwordValid ? passwordErrorText : null,
      ),
      controller: _passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => widget.bloc.updatePassword(password),
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
      // onEditingComplete: _submit,
    );
  }

  TextField _buildConfirmPasswordTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      focusNode: _confirmPasswordFocusNode,
      decoration: InputDecoration(
        hintText: '* ????????????????????????????????? *',
        labelText: '????????????????????????',
        errorText: model.passwordValid ? passwordErrorText : null,
      ),
      controller: _confirmPasswordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => widget.bloc.updateConfirmPassword(password),
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_lastNameFocusNode),
      // onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        hintText: 'email@sample.com',
        labelText: '?????????????????????',
        errorText: model.emailValid ? emailErrorText : null,
      ),
      controller: _emailController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passWordFocusNode),
      onChanged: (email) => widget.bloc.updateEmail(email),
    );
  }

  TextField _surNameTextField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _surNameFocusNode,
      decoration: InputDecoration(
        hintText: '??????',
        labelText: '??????',
        errorText: model.surNameValid ? surNameErrorText : null,
      ),
      controller: _surNameController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_lastNameFriganaFocusNode),
      onChanged: (surName) => widget.bloc.updateSurName(surName),
    );
  }

  TextField _lastNameField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _lastNameFocusNode,
      decoration: InputDecoration(
        hintText: '??????',
        labelText: '??????',
        errorText: model.lastNameValid ? lastNameErrorText : null,
      ),
      controller: _lastNameController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_surNameFocusNode),
      onChanged: (lastName) => widget.bloc.updateLastName(lastName),
    );
  }

  TextField _surNameFuriganaNameField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _surNameFuriganaFocusNode,
      decoration: InputDecoration(
        hintText: '?????????',
        labelText: '????????????????????????',
        errorText: model.surNameFuriganaValid ? surNameFuriganaErrorText : null,
      ),
      controller: _surNameFuriganaController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_callNumberFocusNode),
      onChanged: (surNameF) => widget.bloc.updateSurNameFurigana(surNameF),
    );
  }

  TextField _lastNameFuriganaField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.text,
      focusNode: _lastNameFriganaFocusNode,
      decoration: InputDecoration(
        hintText: '?????????',
        labelText: '??????(????????????)',
        errorText: model.lastNameFuriganaValid ? lastNameErrorText : null,
      ),
      controller: _lastNameFuriganaController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_surNameFuriganaFocusNode),
      onChanged: (lastNameF) => widget.bloc.updateLastNameFurigana(lastNameF),
    );
  }

  TextField _callNumberField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _callNumberFocusNode,
      decoration: InputDecoration(
        hintText: '??????07955972139(?????????????????????)',
        labelText: '????????????',
        errorText: model.callNumberValid ? callNumberErrorText : null,
      ),
      controller: _callNumberController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthYearFocusNode),
      onChanged: (callNumber) => widget.bloc.updateCallNumber(callNumber),
    );
  }

  TextField _birthYearField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthYearFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 1993',
        labelText: '???',
        errorText: model.birthYearValid ? birthYearErrorText : null,
      ),
      controller: _birthYearController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthMonthFocusNode),
      onChanged: (year) => widget.bloc.updateBirthYear(year),
    );
  }

  TextField _birthMonthField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthMonthFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 04',
        labelText: '???',
        errorText: model.birthMonthValid ? birthMonthErrorText : null,
      ),
      controller: _birthMonthController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_birthDayFocusNode),
      onChanged: (month) => widget.bloc.updateBirthMonth(month),
    );
  }

  TextField _birthDayField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _birthDayFocusNode,
      decoration: InputDecoration(
        hintText: '??? : 21',
        labelText: '???',
        errorText: model.birthDayValid ? birthDayErrorText : null,
      ),
      controller: _birthDayController,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_withSpouceFocusNode),
      onChanged: (day) => widget.bloc.updateBirthDay(day),
    );
  }

  Widget _isSpouceSwitch({required RegisterModel model}) {
    final icon = model.isSpouce
        ? Icons.check_circle_outline
        : Icons.not_interested_outlined;
    final color = model.isSpouce ? Colors.green.shade300 : Colors.grey;
    return Row(
      children: [
        Icon(icon, color: color),
        Text('??????????????????'),
        Spacer(),
        Switch(
          focusNode: _withSpouceFocusNode,
          value: model.isSpouce,
          onChanged: widget.bloc.updateIsSpouce,
        ),
      ],
    );
  }

  TextField _haveChildredField({required RegisterModel model}) {
    return TextField(
      keyboardType: TextInputType.datetime,
      focusNode: _numberOfChildrenFocusNode,
      decoration: InputDecoration(
        hintText: '(????????????)',
        labelText: '???????????????',
        errorText: model.haveChildValid ? haveChildrenErrorText : null,
      ),
      controller: _numberOfChildrenController,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      onChanged: (haveChildren) => widget.bloc.updateHaveChildren(haveChildren),
    );
  }

  TextStyle titleStyle() {
    return GoogleFonts.notoSans(fontSize: 16.0, fontWeight: FontWeight.w400);
  }
}
