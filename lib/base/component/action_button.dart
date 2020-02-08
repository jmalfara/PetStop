import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/info/text_info.dart';

class ActionButton extends StatelessWidget {
  final TextInfo text;
  final Function() onPressed;
  final bool loading;
  final FocusNode focusNode;

  const ActionButton({
    Key key,
    this.text,
    this.onPressed,
    this.loading = false,
    this.focusNode,
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
      ) : Text(text.toString()),
      focusNode: focusNode,
    );
  }
}