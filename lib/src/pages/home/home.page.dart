import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../constants.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../widgets.dart';
import '../../routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.image('welcome.png'), width: 190, height: 190),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 0),
              child: Text('$APP_NAME!', style: logoStyle),
            ),
            _signInButton(context),
            _signUpButton(context),
            _languageSelection(context),
          ],
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(bottom: 0),
      child: CustomFlatButton(
        child: Text('Sign In'),
        onPressed: () => Routes.toSignIn(context),
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(0),
      child: CustomOutlineButton(
        child: Text('Sign Up'),
        onPressed: () => Routes.toSignUp(context),
      ),
    );
  }

  Widget _languageSelection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Langauage:', style: TextStyle(color: darkText)),
          Container(
            margin: EdgeInsets.only(left: 6),
            child: Text('English ›', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
