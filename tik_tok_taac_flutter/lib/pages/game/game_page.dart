import 'dart:ui';

import 'package:animated_background/animated_background.dart';

import 'package:flutter/material.dart';
import 'package:tik_tok_taac_flutter/confUI.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  static const String PLAYER_X = "X";
  static const String PLAYER_Y = "O";

  late String currentPlayer;
  late String result;
  late bool gameEnd;
  late List<String> occupied;

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    result = '';
    currentPlayer = PLAYER_X;
    gameEnd = false;
    occupied = ["", "", "", "", "", "", "", "", ""];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tik Tok Taac - 1 vs 1'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: AnimatedBackground(
          behaviour: RacingLinesBehaviour(),
          vsync: this,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headerText(currentPlayer),
                gameContainer(),
                SizedBox(
                  height: 30,
                ),
                restartButton(),
                gameOverText()
              ],
            ),
          ),
        ));
  }

  //texts turn
  Widget headerText(String currentPlayer) {
    return Column(
      children: [
        Text(
          "$currentPlayer turn",
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  // grid builder
  Widget gameContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height / 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, int index) {
            return box(index);
          }),
    );
  }

  //box actions
  Widget box(int index) {
    return InkWell(
      onTap: () {
        if (gameEnd || occupied[index].isNotEmpty) {
          return;
        }

        setState(() {
          occupied[index] = currentPlayer;

          checkForWinner();
          checkForDraw();
          changeTurn();
        });
      },
      child: Container(
        color: occupied[index].isEmpty
            ? Colors.black26
            : occupied[index] == PLAYER_X
                ? Color.fromARGB(0, 105, 201, 208)
                : ConfColor.redCrayola,
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            occupied[index],
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }

  //restart
  restartButton() {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          //reset
          setState(() {
            initializeGame();
          });
        });
      },
      icon: Icon(Icons.replay),
      label: Text('RESTART'),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(100, 40),
          textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          primary: Colors.yellow,
          onPrimary: Colors.black,
          elevation: 15,
          shadowColor: Colors.yellow),
    );
  }

  changeTurn() {
    if (currentPlayer == PLAYER_X) {
      currentPlayer = PLAYER_Y;
    } else {
      currentPlayer = PLAYER_X;
    }
  }

  //win conditions
  checkForWinner() {
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      String playerPosition0 = occupied[winningPos[0]];
      String playerPosition1 = occupied[winningPos[1]];
      String playerPosition2 = occupied[winningPos[2]];

      if (playerPosition0.isNotEmpty) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          result = '$currentPlayer win';
          gameEnd = true;
          return;
        }
      }
    }
  }

  //draw condition
  checkForDraw() {
    if (gameEnd) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in occupied) {
      if (occupiedPlayer.isEmpty) {
        draw = false;
      }
    }

    if (draw) {
      result = 'Draw';
      gameEnd = true;
    }
  }

  Widget gameOverText() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          result,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
