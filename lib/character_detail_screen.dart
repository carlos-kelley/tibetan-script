import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/character.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  bool _isTibetan = true;

  void _toggleLanguage() {
    setState(() {
      _isTibetan = !_isTibetan;
      HapticFeedback.mediumImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        // TODO: make text at top without navigation bar
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.transparent,
          middle: Text(widget.character.place,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              )),
        ),
        child: Center(
          child: GestureDetector(
            onTap: _toggleLanguage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isTibetan
                      ? widget.character.tibetan
                      : widget.character.english,
                  style: TextStyle(
                    fontSize: _isTibetan ? 140 : 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _isTibetan ? widget.character.phonation : '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
