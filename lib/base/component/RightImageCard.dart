import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dimen.dart';

class RightImageCard extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const RightImageCard({
    Key key,
    this.image,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 100,
          minHeight: 100
        ),
        child: InkWell(
          onTap: () => print("Tap"),
          child: Row(
            children: <Widget>[
//              Image.network(image),
              Placeholder(),
              Container(
                padding: EdgeInsets.fromLTRB(Dimensions.margin_medium, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
}
