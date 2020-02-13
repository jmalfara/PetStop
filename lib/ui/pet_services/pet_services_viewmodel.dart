import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/domain/model/product_group.dart';
import 'package:petstop/redux/action/product_group.dart';
import 'package:petstop/service/response.dart';
import 'package:redux/redux.dart';
import 'package:petstop/redux/appstate.dart';
import 'package:petstop/base/viewmodel/viewmodel.dart';

class PetServicesViewModel extends ViewModel {
  PetServicesViewModel(Store<AppState> store) : super(store);

  Stream<ServiceResponse<ProductGroup>> onFetchPetServices(PetType petType) {
      switch(petType) {
      case PetType.RABBIT:
        return executeRequest(services.productsService.fetchRabbitProducts);
      case PetType.DOG:
      case PetType.CAT:
      case PetType.HAMSTER:
      case PetType.FISH:
      case PetType.BIRD:
        throw Exception("Not Implemented");
    }
  }

  storeProductGroup(PetType petType, ProductGroup productGroup) {
    switch(petType) {
      case PetType.RABBIT:
        return store.dispatch(StoreRabbitProductGroup(productGroup));
      case PetType.DOG:
      case PetType.CAT:
      case PetType.HAMSTER:
      case PetType.FISH:
      case PetType.BIRD:
        throw Exception("Not Implemented");
    }
  }

  ProductGroup getProductGroup(PetType petType) {
    switch(petType) {
      case PetType.RABBIT:
        return store.state.rabbitProductGroup;
      case PetType.DOG:
      case PetType.CAT:
      case PetType.HAMSTER:
      case PetType.FISH:
      case PetType.BIRD:
        throw Exception("Not Implemented");
    }
  }
}