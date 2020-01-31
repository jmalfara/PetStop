import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/base/dimen.dart';
import 'package:flutterRedux/base/info/text_info.dart';
import 'package:flutter_svg/svg.dart';

class EmptyState extends StatelessWidget {
  final TextInfo message;
  final String imagePath;
  final Function() action;
  final TextInfo actionText;

  const EmptyState({
    Key key,
    this.message,
    this.imagePath,
    this.action,
    this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.margin_small_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: _renderBody(context)
          ),
          Flexible(
            flex: 0,
            child: _renderAction()
          )
        ],
      ),
    );
  }

  _renderBody(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: SvgPicture.asset(imagePath,
            width: Dimensions.image_large,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
        ),
        Text(
          message.toString(),
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _renderAction() {
    if (action == null || actionText == null) {
      return Container();
    }

    return RaisedButton(
        child: Text(actionText.toString()),
        onPressed: action
    );
  }
}
