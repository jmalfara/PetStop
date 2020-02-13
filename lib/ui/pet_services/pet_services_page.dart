import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:petstop/base/component/product_card.dart';
import 'package:petstop/base/dimen.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/base/notify.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/domain/model/products.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/ui/pet_services/pet_services_viewmodel.dart';
import 'package:redux/redux.dart';
import 'package:petstop/base/extensions/streamextensions.dart';

class PetServicesPage extends StatelessWidget {
  final Pet pet;

  const PetServicesPage({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PetServicesViewModel>(
        onInitialBuild: (viewModel) => initialize(context, viewModel),
        converter: (Store<AppState> store) => PetServicesViewModel(store),
        builder: (BuildContext context, PetServicesViewModel viewModel) => Center(
            child: viewModel.getProductGroup(pet.type) == null ? renderLoading() : renderGrid(context, viewModel)
        )
    );
  }

  initialize(BuildContext context, PetServicesViewModel viewModel) {
    if (viewModel.getProductGroup(pet.type) != null) {
      // Already have the data.
      return;
    }

    viewModel.onFetchPetServices(pet.type).singleObserve(
        success: (productGroup) {
          viewModel.storeProductGroup(pet.type, productGroup);
        },
        failure: (error) => showSnackbar(context, error),
        loading: () => print("Loading")
    );
  }

  renderLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  renderGrid(BuildContext context, PetServicesViewModel viewModel) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(Dimensions.margin_medium, 0, Dimensions.margin_medium, 0),
      children: <Widget>[
        renderSubheading(context, TextInfo(raw: "Food")),
        renderProductPreview(viewModel.getProductGroup(pet.type).foodProducts),
        renderSubheading(context, TextInfo(raw: "Grooming")),
        renderProductPreview(viewModel.getProductGroup(pet.type).groomingProducts),
        renderSubheading(context, TextInfo(raw: "Toys")),
        renderProductPreview(viewModel.getProductGroup(pet.type).toyProducts)
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

  renderProductPreview(List<Product> products) {
    print(products.length);
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, i) => ProductCard(
            image: products[i].imageUrl,
            content: TextInfo(raw: products[i].name),
          )
      )
    );
  }
}