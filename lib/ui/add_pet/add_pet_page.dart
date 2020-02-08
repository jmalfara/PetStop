import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstop/base/component/action_button.dart';
import 'package:petstop/base/dimen.dart';
import 'package:petstop/base/form/grid_form_feild.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/base/stateful.dart';
import 'package:petstop/base/validators/validator.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/main.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/resources/images.dart';
import 'package:petstop/ui/add_pet/add_pet_controller.dart';
import 'package:petstop/ui/add_pet/add_pet_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:petstop/base/extensions/streamextensions.dart';

class AddPetPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final detailsFieldController = TextEditingController();
  final petSelectGridController = GridFormFieldController<PetType>();
  final detailsFieldNode = FocusNode();
  final submitButtonNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddPetViewModel>(
      converter: (Store<AppState> store) => AddPetViewModel(store),
      builder: (BuildContext context, AddPetViewModel viewModel) => ListView(
        padding: EdgeInsets.all(Dimensions.margin_medium),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _renderInputForm(context, viewModel),
          _renderSubmitButton(viewModel, context),
        ],
      )
    );
  }

  _renderInputForm(BuildContext context, AddPetViewModel viewModel) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _renderTitle(TextInfo(raw: "Select your pet type")),
              _renderPetTypeGrid(viewModel),
              _renderTitle(TextInfo(raw: "Extra details")),
              _renderNameInput(context, viewModel),
              _renderDetailsInput(context, viewModel),
            ]
        )
    );
  }

  _renderPetTypeGrid(AddPetViewModel viewModel) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
        child: GridFormField<PetType>(
          controller: petSelectGridController,
          validator: (petType) => requiredNotNullValidator(petType, TextInfo(raw: "Select an option")),
          items: [
            GridItem(SvgPicture.asset(Images.dog), PetType.DOG),
            GridItem(SvgPicture.asset(Images.cat), PetType.CAT),
            GridItem(SvgPicture.asset(Images.hamster), PetType.HAMSTER),
            GridItem(SvgPicture.asset(Images.rabbit), PetType.RABBIT),
            GridItem(SvgPicture.asset(Images.fish), PetType.FISH),
            GridItem(SvgPicture.asset(Images.bird), PetType.BIRD),
          ],
        )
    );
  }

  _renderNameInput(BuildContext context, AddPetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
      child: TextFormField(
        controller: nameFieldController,
        validator: (value) => requiredTextValidator(value, TextInfo(raw: "Required")),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: TextInfo(raw: "Name").toString(),
        ),
        onFieldSubmitted: (v){
          FocusScope.of(context).requestFocus(detailsFieldNode);
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }

  _renderDetailsInput(BuildContext context, AddPetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, Dimensions.margin_medium),
      child: TextFormField(
        controller: detailsFieldController,
        validator: (value) => requiredTextValidator(value, TextInfo(raw: "Required")),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: TextInfo(raw: "Details").toString(),
        ),
        focusNode: detailsFieldNode,
        onFieldSubmitted: (v){
          FocusScope.of(context).requestFocus(submitButtonNode);
        },
        textInputAction: TextInputAction.next,
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

          Pet pet = Pet(
            name: nameFieldController.text,
            details: detailsFieldController.text,
            type: petSelectGridController.value()
          );

          viewModel.onAddPet(pet).singleObserve(
              success: (pet) {
                petSelectGridController.clear();
                nameFieldController.clear();
                detailsFieldController.clear();
                controlHandleAddPetSuccess(viewModel, context, pet);
              },
              failure: (error) => controlHandleAddPetFailure(viewModel, context, error),
              loading: () => controlHandleAddPetLoading(viewModel),
              any: () => FocusScope.of(context).requestFocus(submitButtonNode)
          );
        }
      },
      text: TextInfo(raw: "Submit"),
      loading: viewModel.accountState == ValueState.LOADING,
      focusNode: submitButtonNode,
    );
  }
}