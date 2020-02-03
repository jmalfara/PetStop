import 'package:flutterRedux/domain/model/pet.dart';
import 'package:flutterRedux/resources/images.dart';

class PetPresenter {
  final Pet pet;

  PetPresenter(this.pet);

  String get imagePath {
    switch (pet.type) {
      case PetType.DOG:
        return Images.dog;
      case PetType.CAT:
        return Images.cat;
      case PetType.RABBIT:
        return Images.rabbit;
      case PetType.HAMSTER:
        return Images.dog;
      case PetType.FISH:
        return Images.fish;
      case PetType.BIRD:
        return Images.bird;
    }
    return Images.petDefault;
  }
}