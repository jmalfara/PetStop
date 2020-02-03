import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/main.dart';
import 'package:flutterRedux/ui/add_pet/add_pet_viewmodel.dart';

void controlHandleAddPetLoading(AddPetViewModel viewModel) {
  viewModel.accountState = ValueState.LOADING;
}

void controlHandleAddPetSuccess(AddPetViewModel viewModel, BuildContext context, Pet pet) {
  viewModel.postNewPet(pet);
  viewModel.accountState = ValueState.SUCCESS;

  viewModel.clearNewPetData();
  navigatorKey.currentState.pop();
}

void controlHandleAddPetFailure(AddPetViewModel viewModel, BuildContext context, String error) {
  viewModel.accountState = ValueState.FAILURE;
}
