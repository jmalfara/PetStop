import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterRedux/base/component/action_button.dart';
import 'package:flutterRedux/base/dimen.dart';
import 'package:flutterRedux/base/form/grid_form_feild.dart';
import 'package:flutterRedux/base/info/text_info.dart';
import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/base/validators/validator.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/main.dart';
import 'package:flutterRedux/resources/images.dart';
import 'package:flutterRedux/ui/add_pet/add_pet_controller.dart';
import 'package:flutterRedux/ui/add_pet/add_pet_viewmodel.dart';
import 'package:flutterRedux/ui/login/login_controller.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/ui/login/login_viewmodel.dart';
import 'package:flutterRedux/base/extensions/streamextensions.dart';

class AddPetEntry extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddPetViewModel>(
        converter: (Store<AppState> store) => AddPetViewModel(store),
        builder: (BuildContext context, AddPetViewModel viewModel) => Scaffold(
          appBar: AppBar(
            title: Text(TextInfo(raw: "Add Pet").toString()),
          ),
          body: ListView(
            padding: EdgeInsets.all(Dimensions.margin_medium),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _renderInputForm(viewModel),
              _renderSubmitButton(viewModel, context),
            ],
          ),
        )
    );
  }

  _renderInputForm(AddPetViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _renderTitle(TextInfo(raw: "Select your pet type")),
          _renderPetTypeGrid(viewModel),
          _renderTitle(TextInfo(raw: "Extra details")),
          _renderNameInput(viewModel),
          _renderDetailsInput(viewModel),
        ]
      )
    );
  }

  _renderPetTypeGrid(AddPetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
      child: GridFormField<PetType>(
        onChange: (petType) => viewModel.petType = petType,
        validator: (petType) => requiredNotNullValidator(petType, TextInfo(raw: "Select an option")),
        items: [
          GridItem(SvgPicture.asset(Images.dog), PetType.DOG),
          GridItem(SvgPicture.asset(Images.cat), PetType.CAT),
          GridItem(SvgPicture.asset(Images.hamster), PetType.HAMSTER),
          GridItem(SvgPicture.asset(Images.rabbit), PetType.RABBIT),
        ],
      )
    );
  }

  _renderNameInput(AddPetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
      child: TextFormField(
        onChanged: (text) => viewModel.petName = text,
        validator: (value) => requiredTextValidator(value, TextInfo(raw: "Required")),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: TextInfo(raw: "Name").toString(),
        ),
      ),
    );
  }

  _renderDetailsInput(AddPetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
      child: TextFormField(
        onChanged: (text) => viewModel.petDetails = text,
        validator: (value) => requiredTextValidator(value, TextInfo(raw: "Required")),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: TextInfo(raw: "Details").toString(),
        ),
      ),
    );
  }

  _renderTitle(TextInfo info) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
        child: Text(info.toString(),
          style: Theme.of(navigatorKey.currentContext).textTheme.subtitle
      )
    );
  }

  _renderSubmitButton(AddPetViewModel viewModel, BuildContext context) {
    return ActionButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          viewModel.onAddPet(viewModel.pet.copy()).singleObserve(
              success: (pet) => controlHandleAddPetSuccess(viewModel, context, pet),
              failure: (error) => controlHandleAddPetFailure(viewModel, context, error),
              loading: () => controlHandleAddPetLoading(viewModel)
          );
        }
      },
      text: TextInfo(raw: "Submit"),
      loading: viewModel.accountState == ValueState.LOADING,
    );
  }
}
