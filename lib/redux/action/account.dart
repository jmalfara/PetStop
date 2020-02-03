import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/account.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/redux/action/stateful.dart';

class StoreAccountAction {
  final Account account;
  StoreAccountAction(this.account);
}

class AddPetAccountAction {
  final Pet pet;
  AddPetAccountAction(this.pet);
}

Stateful<Account> accountReducer(Stateful<Account> prev, action) {
  if (action is UpdateStatefulAction && action.object == prev) {
    return prev.copy(state: action.state);
  }

  if (action is StoreAccountAction) {
    return prev.copy(data: action.account);
  }

  if (action is AddPetAccountAction) {
    var pets = [
      ...prev.data.pets,
      action.pet
    ];

    return prev.copy(
      data: prev.data.copy(
        pets: pets
      )
    );
  }

  return prev;
}