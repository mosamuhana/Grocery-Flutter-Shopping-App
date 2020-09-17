import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../services.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = '';
  String password = '';
  bool busy = false;

  bool get valid => !busy && email.isNotEmpty && password.length >= 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: _insets20,
            child: Text('Welcome Back', style: h3),
          ),
          Container(
            margin: _insetsH20,
            padding: _insets20,
            decoration: _decoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SIGN IN', style: h3),
                SizedBox(height: 10),
                OutlineTextInput(
                  hintText: 'Email',
                  onChanged: (v) => setState(() => email = v.trim()),
                ),
                OutlinePasswordInput(
                  hintText: 'Password',
                  onChanged: (v) => setState(() => password = v.trim()),
                ),
                FlatButton(
                  child: Text('Forgot Password?', style: contrastTextBold),
                  onPressed: () => Routes.toForgotPassword(context),
                ),
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

  Widget get _submitButton {
    return Builder(
      builder: (context) {
        return NextButton(
          title: 'Sign In',
          onPressed: !valid ? null : () => _onSubmit(context),
        );
      },
    );
  }

  Widget get _orSignup {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('OR'),
        FlatButton(
          child: Text('Sign Up', style: contrastText.copyWith(fontSize: 20)),
          onPressed: () async {
            await Routes.toSignUp(context);
          },
        ),
      ],
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    setState(() => busy = true);
    try {
      final user = await AuthService.instance.signIn(email: email, password: password);
      if (user != null) {
        await Routes.toDashboard(context);
      } else {
        SnackbarService.instance.showError(context, 'Invalid email/password');
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
