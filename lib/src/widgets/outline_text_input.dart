import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';

class OutlineTextInput extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;

  const OutlineTextInput({
    Key key,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        cursorColor: primaryColor,
        style: inputFieldTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle,
        ),
      ),
    );
  }
}
