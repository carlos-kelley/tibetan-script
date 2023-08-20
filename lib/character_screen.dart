import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tibetan_script/models/character.dart';
import 'package:tibetan_script/models/character_service.dart';
import 'package:tibetan_script/character_detail_screen.dart';
import 'package:flutter/services.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final futureCharacters = CharacterService.getCharacters();

    return SafeArea(
      child: CupertinoPageScaffold(
        child: FutureBuilder<List<Character>>(
          future: futureCharacters,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              final characters = snapshot.data!;
              final groups =
                  groupBy(characters, (character) => character.place);

              return ListView.separated(
                itemCount: groups.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final place = groups.keys.elementAt(index);
                  final characters = groups[place]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only (top: 40, bottom: 10),
                        child: Text(
                          place,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: characters.length,
                          itemBuilder: (context, index) {
                            final character = characters[index];
                            return GestureDetector(
                              onTap: () {
                                HapticFeedback.mediumImpact();
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CharacterDetailScreen(
                                        character: character),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(character.tibetan,
                                      style: const TextStyle(fontSize: 46)),
                                  const SizedBox(width: 80),
                                  Text(character.english,
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

Map<String, List<T>> groupBy<T>(List<T> list, String Function(T) keyGetter) {
  final map = <String, List<T>>{};
  for (final item in list) {
    final key = keyGetter(item);
    if (!map.containsKey(key)) {
      map[key] = <T>[];
    }
    map[key]!.add(item);
  }
  return map;
}
