import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/base/component/empty_state.dart';
import 'package:flutterRedux/base/info/text_info.dart';
import 'package:flutterRedux/base/presenters/pet_presenter.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/resources/images.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';

import '../core_viewmodel.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CoreViewModel>(
      converter: (Store<AppState> store) => CoreViewModel(store),
      builder: (BuildContext context, CoreViewModel viewModel) => _renderPage(viewModel)
    );
  }

  _renderPage(CoreViewModel viewModel) {
    if (viewModel.account.pets.length == 0) {
      return _renderEmptyState();
    }

    return ListView.builder(
      itemCount: viewModel.account.pets.length,
      itemBuilder: (BuildContext context, int index) =>
          _renderListTile(viewModel.account.pets[index])
    );
  }

  _renderEmptyState() {
    return Container(
      alignment: Alignment(0,0),
      child: EmptyState(
        message: TextInfo(raw: "Add your first pet.\nStart with clicking below."),
        imagePath: Images.dog,
        action: () => print("Click Action"),
        actionText: TextInfo(raw: "Add a Pet"),
      )
    );
  }
  
  _renderListTile(Pet pet) {
    PetPresenter presenter = PetPresenter(pet);
    String imageUrl = presenter.imagePath;
    
    return ListTile(
      title: Text(pet.name),
      subtitle: Text(pet.details),
      leading: SvgPicture.asset(imageUrl, width: 50),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => print("Next Page"),
    );
  }
}