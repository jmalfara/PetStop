import 'package:petstop/domain/model/pet.dart';

class UpdateNamePetAction {
  final String name;
  UpdateNamePetAction(this.name);
}

class UpdateDetailsPetAction {
  final String details;
  UpdateDetailsPetAction(this.details);
}

class UpdateTypePetAction {
  final PetType type;
  UpdateTypePetAction(this.type);
}

class ClearPetAction {}

Pet addPetReducer(Pet prev, action) {
  if (action is UpdateNamePetAction) {
    return prev.copy(
      name: action.name
    );
  }

  if (action is UpdateDetailsPetAction) {
    return prev.copy(
        details: action.details
    );
  }

  if (action is UpdateTypePetAction) {
    return prev.copy(
        type: action.type
    );
  }

  if (action is ClearPetAction) {
    return Pet();
  }

  return prev;
}