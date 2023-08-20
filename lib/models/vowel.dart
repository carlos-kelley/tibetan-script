class Vowel {
  final int id;
  final String tibetan;
  final String ipa;


  Vowel({
    // required means that the parameter is mandatory when calling the constructor
    required this.id,
    required this.tibetan,
    required this.ipa,
  });

  // This method is used to convert a json object to a Character object
  // A factory constructor will construct an object from a JSON object
  factory Vowel.fromJson(Map<String, dynamic> json) {
    return Vowel(
      id: json['id'],
      tibetan: json['tibetan'],
      ipa: json['ipa'],
    );
  }
}
