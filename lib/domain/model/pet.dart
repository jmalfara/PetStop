class Pet {
  final String id;
  final String name;
  final String details;
  final PetType type;

  Pet({
    this.id,
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
      id: id,
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