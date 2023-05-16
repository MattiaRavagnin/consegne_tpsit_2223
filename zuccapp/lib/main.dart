import 'package:flutter/material.dart';
import 'package:zuccapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0x2e4053)),
      //home: GameScreen(),
      //home: HomePages(),
      home: HomePage(),
    );
  }
}
