import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
            minHeight: 100
          ),
          child: Icon(Icons.add),
        ),
      )
    );
  }
}
