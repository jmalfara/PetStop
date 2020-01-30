import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String title;

  const ImageCard({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Positioned.fill(
        bottom: 0.0,
        child: new GridTile(
            footer: new GridTileBar(
              title: new Text(title),
              subtitle: new Text(title),
              backgroundColor: Colors.black45,
              trailing: new Icon(
                Icons.launch,
                color: Colors.white,
              ),
            ),
            child: new Image.network(image, fit: BoxFit.cover)),
      ),
      new Positioned.fill(
          child: new Material(
              color: Colors.transparent,
              child: new InkWell(
                splashColor: Colors.lightGreenAccent,
                onTap: () => print("TAP"),
              ))),
    ]);
  }
}