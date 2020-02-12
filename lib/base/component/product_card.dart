import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/dimen.dart';
import 'package:petstop/base/info/text_info.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final TextInfo content;

  const ProductCard({Key key, this.image, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Image.network(image ?? "")
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.margin_small),
              child: Text(content.toString(),
                style: Theme.of(context).textTheme.subtitle,
              ),
            )
          ],
        ),
      )
    );
  }
}