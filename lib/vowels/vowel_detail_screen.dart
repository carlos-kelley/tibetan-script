import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tibetan_script/models/vowel.dart';

class VowelDetailScreen extends StatefulWidget {
  const VowelDetailScreen({Key? key, required this.vowel}) : super(key: key);

  final Vowel vowel;

  @override
  State<VowelDetailScreen> createState() => _VowelDetailScreenState();
}

class _VowelDetailScreenState extends State<VowelDetailScreen> {
  bool _isTibetan = true;

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
          child: Text(
            _isTibetan ? widget.vowel.tibetan : widget.vowel.ipa,
            style: TextStyle(
              fontSize: _isTibetan ? 140 : 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
