import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../services.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email = '';
  bool busy = false;

  bool get valid => !busy && email.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: _insets20,
            child: Text('Forgot Password', style: h3),
          ),
          Container(
            margin: _insetsH20,
            padding: _insets20,
            decoration: _decoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('RESET PASSWORD', style: h3),
                SizedBox(height: 10),
                OutlineTextInput(
                  hintText: 'Email',
                  onChanged: (v) => setState(() => email = v.trim()),
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
          _orButtons,
        ],
      ),
    );
  }

  Widget get _submitButton {
    return Builder(
      builder: (context) {
        return NextButton(
          title: 'Reset',
          onPressed: !valid ? null : () => _onSubmit(context),
        );
      },
    );
  }

  Widget get _orButtons {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('OR'),
        FlatButton(
          child: Text('Sign In', style: contrastText.copyWith(fontSize: 20)),
          onPressed: () => Routes.toSignIn(context),
        ),
        FlatButton(
          child: Text('Sign Up', style: contrastText.copyWith(fontSize: 20)),
          onPressed: () => Routes.toSignUp(context),
        ),
      ],
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    setState(() => busy = true);
    try {
      final ok = await AuthService.instance.forgotPassword(email);
      if (ok) {
        SnackbarService.instance.showInfo(context, 'Password reset successfully.');
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
