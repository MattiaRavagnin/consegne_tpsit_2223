import 'package:flutter/material.dart';
import 'package:tik_tok_taac_flutter/confUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";

  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  // Game game = Game(); classe dart per la logica di gioco

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ConfColor.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's ${lastValue} turn".toUpperCase(),
              style: TextStyle(
                color: ConfColor.black,
                fontSize: 58,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // https://github.com/doctorcode9/Flutter-Tic-Tact-Toe-Game
            // TODO: make game class that will contains all data and method
          ]),
    );
  }
}
