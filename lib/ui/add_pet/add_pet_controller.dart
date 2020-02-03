import 'package:flutter/cupertino.dart';
import 'package:flutterRedux/base/info/text_info.dart';
import 'package:flutterRedux/base/notify.dart';
import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/ui/add_pet/add_pet_viewmodel.dart';

void controlHandleAddPetLoading(AddPetViewModel viewModel) {
  viewModel.accountState = ValueState.LOADING;
}

void controlHandleAddPetSuccess(AddPetViewModel viewModel, BuildContext context, Pet pet) {
  viewModel.postNewPet(pet);
  viewModel.accountState = ValueState.SUCCESS;

  viewModel.clearNewPetData();
  showSnackbar(context, TextInfo(raw: "Successfully added ${pet.name} as a pet").toString());
}

void controlHandleAddPetFailure(AddPetViewModel viewModel, BuildContext context, String error) {
  showSnackbar(context, error);
  viewModel.accountState = ValueState.FAILURE;
}
