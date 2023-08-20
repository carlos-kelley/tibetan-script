import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/character.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: GestureDetector(
          onTap: _toggleLanguage,
          child: Text(
            _isTibetan ? widget.character.tibetan : widget.character.english,
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
