import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/account.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/redux/action/stateful.dart';

class StorePetsAction {
  final List<Pet> pets;
  StorePetsAction(this.pets);
}

Stateful<List<Pet>> petsReducer(Stateful<List<Pet>> prev, action) {
  if (action is UpdateStatefulAction && action.object == prev) {
    return prev.copy(state: action.state);
  }

  if (action is StorePetsAction) {
    return prev.copy(data: action.pets);
  }

  return prev;
}