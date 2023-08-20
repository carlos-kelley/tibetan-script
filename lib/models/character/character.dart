class Character {
  final int id;
  final String tibetan;
  final String english;
  final String place;
  final String phonation;

  Character({
    // required means that the parameter is mandatory when calling the constructor
    required this.id,
    required this.tibetan,
    required this.english,
    required this.place,
    required this.phonation,
  });

  // This method is used to convert a json object to a Character object
  // A factory constructor will construct an object from a JSON object
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
