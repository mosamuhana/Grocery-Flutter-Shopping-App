import 'package:flutter/material.dart';

import '../shared/colors.dart';

class CustomFlatButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomFlatButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      textColor: white,
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomOutlineButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      child: child,
      textColor: primaryColor,
      highlightedBorderColor: highlightColor,
      borderSide: BorderSide(color: primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomRaisedButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: child,
      textColor: white,
      color: primaryColor,
      disabledTextColor: Colors.white70,
      elevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}

class NextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NextButton({
    Key key,
    this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disabledTextColor = Colors.white70;
    final disabled = onPressed == null;

    return RaisedButton(
      onPressed: onPressed,
      textColor: white,
      color: primaryColor,
      disabledTextColor: disabledTextColor,
      elevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          if (title != null) ...[
            Text(title),
            SizedBox(width: 5),
          ],
          Icon(
            Icons.arrow_forward_ios,
            color: disabled ? disabledTextColor : white,
            size: 15,
          ),
        ],
      ),
    );
  }
}
