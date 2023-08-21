import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tibetan_script/models/number.dart';

class NumberDetailScreen extends StatefulWidget {
  const NumberDetailScreen({Key? key, required this.number}) : super(key: key);
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
    return CupertinoPageScaffold(
      child: Center(
        child: GestureDetector(
          onTap: _toggleLanguage,
          child: Text(
            _isTibetan ? widget.number.tibetan : widget.number.ipa,
            style: TextStyle(
              fontSize: _isTibetan ? 140 : 70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
