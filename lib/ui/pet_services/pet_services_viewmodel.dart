import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/base/viewmodel/viewmodel.dart';

class PetServicesViewModel extends ViewModel {
  PetServicesViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<Pet>> onFetchPetServices() {
    return executeRequest(() => services.petsService.addPet(null));
  }
}