import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/models/number/number.dart';
import 'package:flutter/services.dart';

class NumberDetailScreen extends StatefulWidget {
  const NumberDetailScreen({super.key, required this.number});

  final Number number;

  @override
  State<NumberDetailScreen> createState() => _NumberDetailScreenState();
}

class _NumberDetailScreenState extends State<NumberDetailScreen> {
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
        statusBarColor: CupertinoColors.white,
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
                _isTibetan ? widget.number.tibetan : widget.number.ipa,
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
