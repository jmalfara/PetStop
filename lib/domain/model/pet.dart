class Pet {
  final String name;
  final String birthday;
  final PetType type;

  Pet({
    this.name,
    this.birthday,
    this.type
  });
}

enum PetType {
  DOG,
  CAT,
  RABBIT,
  SNAKE
}