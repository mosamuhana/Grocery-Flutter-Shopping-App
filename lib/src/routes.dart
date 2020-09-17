import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'models.dart';
import 'pages.dart';
import 'services.dart';

const ROUTE_HOME = '/';
const ROUTE_SIGNUP = '/signup';
const ROUTE_SIGNIN = '/signin';
const ROUTE_DASHBOARD = '/dashboard';
const ROUTE_PRODUCT = '/product';
const ROUTE_FORGOT_PASSWORD = '/forgot_password';

class Routes {
  static String get initialRoute => AuthService.instance.isAuth ? ROUTE_DASHBOARD : ROUTE_HOME;

  static final Map<String, WidgetBuilder> routes = {
    ROUTE_HOME: (_) => HomePage(),
    ROUTE_SIGNUP: (_) => SignUpPage(),
    ROUTE_SIGNIN: (_) => SignInPage(),
    ROUTE_DASHBOARD: (_) => DashboardPage(),
    ROUTE_FORGOT_PASSWORD: (_) => ForgotPasswordPage(),
    ROUTE_PRODUCT: (context) {
      final Product product = ModalRoute.of(context).settings.arguments;
      return ProductPage(product: product);
    },
  };

  static Future<void> toProduct(BuildContext context, Product product) async {
    await Navigator.of(context).pushNamed(ROUTE_PRODUCT, arguments: product);
  }

  static Future<void> toHome(BuildContext context) async {
    await Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
  }

  static Future<void> toSignIn(BuildContext context, [PageTransitionType type = PageTransitionType.rotate]) async {
    await Navigator.pushReplacement(
      context,
      PageTransition(
        type: type ?? PageTransitionType.rotate,
        //duration: Duration(seconds: 1),
        child: SignInPage(),
      ),
    );
    //await Navigator.of(context).pushReplacementNamed(ROUTE_SIGNIN);
  }

  static Future<void> toSignUp(BuildContext context, [PageTransitionType type = PageTransitionType.rotate]) async {
    await Navigator.pushReplacement(
      context,
      PageTransition(
        type: type ?? PageTransitionType.rotate,
        //duration: Duration(seconds: 1),
        child: SignUpPage(),
      ),
    );
    //await Navigator.of(context).pushReplacementNamed(ROUTE_SIGNUP);
  }

  static Future<void> toDashboard(BuildContext context, [PageTransitionType type = PageTransitionType.rightToLeft]) async {
    await Navigator.pushReplacement(
      context,
      PageTransition(
        type: type ?? PageTransitionType.rightToLeft,
        child: DashboardPage(),
      ),
    );
    //await Navigator.of(context).pushReplacementNamed(ROUTE_DASHBOARD);
  }

  static Future<void> toForgotPassword(BuildContext context,
      [PageTransitionType type = PageTransitionType.rightToLeft]) async {
    await Navigator.pushReplacement(
      context,
      PageTransition(
        type: type ?? PageTransitionType.rightToLeft,
        child: ForgotPasswordPage(),
      ),
    );
    //await Navigator.of(context).pushReplacementNamed(ROUTE_FORGOT_PASSWORD);
  }
}
