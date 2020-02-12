import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/component/product_card.dart';
import 'package:petstop/base/dimen.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/domain/model/pet.dart';

class PetServicesPage extends StatelessWidget {
  final Pet pet;

  const PetServicesPage({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(Dimensions.margin_medium, 0, Dimensions.margin_medium, 0),
      children: <Widget>[
        renderSubheading(context, TextInfo(raw: "Food")),
        renderFoodPreview(),
        renderSubheading(context, TextInfo(raw: "Grooming")),
        renderFoodPreview(),
        renderSubheading(context, TextInfo(raw: "Toys")),
        renderFoodPreview()
      ],
    );
  }

  renderSubheading(BuildContext context, TextInfo heading) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, Dimensions.margin_small, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              heading.toString(),
              style: Theme.of(context).textTheme.subhead
          ),
          FlatButton(
            child: Text(TextInfo(raw: "See More").toString()),
            onPressed: () => print("MORE"),
          ),
        ],
      ),
    );
  }

  renderFoodPreview() {
    return Row(
      children: <Widget>[
        ProductCard(
          image: "https://s7d2.scene7.com/is/image/PetSmart/5134286",
          content: TextInfo(raw: "Oxbow Organic Hay. Yum so Good"),
        )
      ],
    );
  }
}