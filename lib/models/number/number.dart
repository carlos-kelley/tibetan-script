class Number {
  final int id;
  final String tibetan;
  final String ipa;
  final String arabic;

  Number({
    // required means that the parameter is mandatory when calling the constructor
    required this.id,
    required this.tibetan,
    required this.ipa,
    required this.arabic,
  });

  // This method is used to convert a json object to a Character object
  // A factory constructor will construct an object from a JSON object
  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      id: json['id'],
      tibetan: json['tibetan'],
      ipa: json['ipa'],
      arabic: json['arabic'],
    );
  }
}
