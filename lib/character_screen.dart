import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/character.dart';
import 'package:tibetan_script/models/character_service.dart';
import 'package:tibetan_script/character_detail_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends State<CharacterScreen> {
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

