import 'package:flutter/material.dart';

class SnackbarService {
  SnackbarService._();

  static SnackbarService _instance;

  static SnackbarService get instance => _instance ??= SnackbarService._();

  void show(BuildContext context, Widget content, [Duration duration]) {
    final s = SnackBar(
      content: content,
      duration: duration ?? _snackBarDisplayDuration,
    );
    Scaffold.of(context).showSnackBar(s);
  }

  void showInfo(BuildContext context, String text, [Duration duration]) {
    final s = SnackBar(
      content: Text(text),
      duration: duration ?? _snackBarDisplayDuration,
    );
    Scaffold.of(context).showSnackBar(s);
  }

  void showError(BuildContext context, String text, [Duration duration]) {
    final s = SnackBar(
      backgroundColor: Colors.red,
      content: Text(text, style: TextStyle(color: Colors.white)),
      duration: duration ?? _snackBarDisplayDuration,
    );
    Scaffold.of(context).showSnackBar(s);
  }
}

const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000);
