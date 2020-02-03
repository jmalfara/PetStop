class Pet {
  final String name;
  final String details;
  final PetType type;

  Pet({
    this.name,
    this.details,
    this.type
  });

  copy({
    String name,
    String details,
    PetType type,
  }) {
    return Pet(
      name: name ?? this.name,
      details: details ?? this.details,
      type: type ?? this.type
    );
  }
}

enum PetType {
  DOG,
  CAT,
  RABBIT,
  HAMSTER,
  FISH,
  BIRD
}