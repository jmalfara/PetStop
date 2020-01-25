import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String error) {
  final snackBar = SnackBar(
    content: Text(error),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

void showSnackbarRetry(BuildContext context, String error, Function() retry) {
  final snackBar = SnackBar(
    content: Text(error),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: retry
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}