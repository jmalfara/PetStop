import 'package:flutterRedux/base/stateful.dart';
import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/redux/action/account.dart';
import 'package:flutterRedux/redux/action/add_pet.dart';
import 'package:flutterRedux/redux/action/stateful.dart';
import 'package:flutterRedux/service/response.dart';
import 'package:redux/redux.dart';
import 'package:flutterRedux/redux/appstate.dart';
import 'package:flutterRedux/base/viewmodel/viewmodel.dart';

class AddPetViewModel extends ViewModel {
  AddPetViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Pet>> onAddPet(Pet pet) {
    return executeRequest(() => services.accountService.addPet(pet));
  }

  set accountState(ValueState state) => store.dispatch(UpdateStatefulAction(state, store.state.account));
  ValueState get accountState => store.state.account.state;

//  set postPet(Pet pet) => store.dispatch((account));
//  Account get account => store.state.account.data;
  postNewPet(Pet pet) {
    store.dispatch(AddPetAccountAction(pet));
  }

  clearNewPetData() {
    store.dispatch(ClearPetAction());
  }

  set petName(String name) => store.dispatch(UpdateNamePetAction(name));
  set petDetails(String details) => store.dispatch(UpdateDetailsPetAction(details));
  set petType(PetType type) => store.dispatch(UpdateTypePetAction(type));

  Pet get pet => store.state.petToAdd;
}