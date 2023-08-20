import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/character.dart';
import 'package:tibetan_script/models/character_service.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  Future<List<Character>>? _futureCharacters;

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
              final characters = snapshot.data!;
              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              CharacterDetailScreen(character: character),
                        ),
                      );
                    },
                    child: Text(character.tibetan),
                  );
                },
              );
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

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(character.tibetan),
      ),
    );
  }
}
