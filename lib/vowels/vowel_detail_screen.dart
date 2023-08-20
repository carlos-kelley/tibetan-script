import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/vowel/vowel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class VowelDetailScreen extends StatefulWidget {
  const VowelDetailScreen({super.key, required this.vowel});

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
// set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return CupertinoPageScaffold(
      child: Center(
        child: GestureDetector(
          onTap: _toggleLanguage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isTibetan ? widget.vowel.tibetan : widget.vowel.ipa,
                style: TextStyle(
                  fontSize: _isTibetan ? 140 : 80,
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
