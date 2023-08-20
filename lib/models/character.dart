class Character {
  final int id;
  final String tibetan;
  final String english;

  Character({
    required this.id,
    required this.tibetan,
    required this.english,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      tibetan: json['tibetan'],
      english: json['english'],
    );
  }
}