import 'package:flutter/cupertino.dart';

import './models/character_service.dart';
import './models/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Future<List<Character>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    _futureCharacters = CharacterService.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: FutureBuilder<List<Character>>(
          future: _futureCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final character = snapshot.data![0];
              return Text(character.tibetan);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
