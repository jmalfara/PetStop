import 'package:flutter/cupertino.dart';
import 'package:petstop/base/info/text_info.dart';
import 'package:petstop/base/notify.dart';
import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/main.dart';
import 'package:petstop/ui/add_pet/add_pet_viewmodel.dart';

void controlHandleAddPetLoading(AddPetViewModel viewModel) {
  viewModel.accountState = ValueState.LOADING;
}

void controlHandleAddPetSuccess(AddPetViewModel viewModel, BuildContext context, Pet pet) {
  viewModel.accountState = ValueState.SUCCESS;

  viewModel.clearNewPetData();
  showSnackbar(context, TextInfo(raw: "Successfully added ${pet.name} as a pet").toString());

//  navigatorKey.currentState.pop();
}

void controlHandleAddPetFailure(AddPetViewModel viewModel, BuildContext context, String error) {
  showSnackbar(context, error);
  viewModel.accountState = ValueState.FAILURE;
}
