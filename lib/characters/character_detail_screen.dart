import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tibetan_script/models/character.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  CharacterDetailScreenState createState() => CharacterDetailScreenState();
}

class CharacterDetailScreenState extends State<CharacterDetailScreen> {
  bool _isTibetan = true;

  // toggle language on tap
  void _toggleLanguage() {
    setState(() {
      _isTibetan = !_isTibetan;
      HapticFeedback.mediumImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: GestureDetector(
          onTap: _toggleLanguage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isTibetan ? widget.character.tibetan : widget.character.english,
                style: TextStyle(
                  fontSize: _isTibetan ? 140 : 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // show phonation only for Tibetan characters
              if (_isTibetan)
                Text(
                  widget.character.phonation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}