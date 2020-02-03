import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/base/info/text_info.dart';

class ActionButton extends StatelessWidget {
  final TextInfo text;
  final Function() onPressed;
  final bool loading;

  const ActionButton({
    Key key,
    this.text,
    this.onPressed,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onPressed: this.loading ? null : this.onPressed,
      child: this.loading ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator()
      ) : Text(text.toString())
    );
  }
}