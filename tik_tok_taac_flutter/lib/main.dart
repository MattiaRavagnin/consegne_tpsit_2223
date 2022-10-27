import 'package:flutter/material.dart';

import 'package:tik_tok_taac_flutter/confUI.dart';

import 'package:tik_tok_taac_flutter/pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: GameScreen(),
      //home: HomePages(),
      home: HomePage(),
    );
  }
}
