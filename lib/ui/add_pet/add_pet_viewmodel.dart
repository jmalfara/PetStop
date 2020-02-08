import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/redux/action/stateful.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/base/viewmodel/viewmodel.dart';

class AddPetViewModel extends ViewModel {
  AddPetViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Pet>> onAddPet(Pet pet) {
    return executeRequest(() => services.petsService.addPet(pet));
  }

  set accountState(ValueState state) => store.dispatch(UpdateStatefulAction(state, store.state.account));
  ValueState get accountState => store.state.account.state;
}