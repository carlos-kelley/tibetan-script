import 'package:flutter/cupertino.dart';
import 'package:tibetan_script/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Tibetan Script',
      theme: CupertinoThemeData(primaryColor: Color.fromARGB(255, 255, 255, 255)),
      home: CharacterScreen(),
    );
  }
}