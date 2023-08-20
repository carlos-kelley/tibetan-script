class Character {
  final int id;
  final String tibetan;
  final String english;
  final String place;
  final String phonation;

  Character({
    required this.id,
    required this.tibetan,
    required this.english,
    required this.place,
    required this.phonation,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      tibetan: json['tibetan'],
      english: json['english'],
      place: json['place'],
      phonation: json['phonation'],
    );
  }
}
