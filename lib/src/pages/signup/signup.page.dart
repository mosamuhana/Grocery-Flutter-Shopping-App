import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models.dart';
import '../../routes.dart';
import '../../services.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String fullName = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  bool busy = false;

  bool get valid => !busy && fullName.isNotEmpty && email.isNotEmpty && password.length >= 4 && password == passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: _insets20,
            child: Text('Welcome To $APP_NAME!', style: h3),
          ),
          Container(
            margin: _insetsH20,
            padding: _insets20,
            decoration: _decoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SIGN UP', style: h3),
                SizedBox(height: 10),
                OutlineTextInput(
                  hintText: 'Full Name',
                  onChanged: (v) => setState(() => fullName = v.trim()),
                ),
                OutlineEmailInput(
                  hintText: 'Email Address',
                  onChanged: (v) => setState(() => email = v.trim()),
                ),
                OutlinePasswordInput(
                  hintText: 'Password',
                  onChanged: (v) => setState(() => password = v.trim()),
                ),
                OutlinePasswordInput(
                  hintText: 'Confirm Password',
                  onChanged: (v) => setState(() => passwordConfirm = v.trim()),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _submitButton,
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _orSignup,
        ],
      ),
    );
  }

  Widget get _orSignup {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('OR'),
        FlatButton(
          child: Text('Sign In', style: contrastText.copyWith(fontSize: 20)),
          onPressed: () async {
            await Routes.toSignIn(context);
          },
        ),
      ],
    );
  }

  Widget get _submitButton {
    return Builder(
      builder: (context) {
        return NextButton(
          title: 'Sign Up',
          onPressed: !valid ? null : () => _onSubmit(context),
        );
      },
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    setState(() => busy = true);
    try {
      User user = await AuthService.instance.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (user != null) {
        await Routes.toDashboard(context);
      } else {
        SnackbarService.instance.showError(context, 'Sign Up error');
      }
    } catch (e) {
      SnackbarService.instance.showError(context, 'Error: ${e.toString()}');
    } finally {
      setState(() => busy = false);
    }
  }

  final _insets20 = EdgeInsets.all(20);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);

  final _decoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(color: Color.fromRGBO(0, 0, 0, .1), blurRadius: 10, spreadRadius: 5, offset: Offset(0, 1)),
    ],
    borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
  );
}
