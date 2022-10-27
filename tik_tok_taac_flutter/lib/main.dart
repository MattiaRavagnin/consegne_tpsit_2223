import 'package:flutter/material.dart';
import 'package:tik_tok_taac_flutter/confUI.dart';
import 'package:tik_tok_taac_flutter/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: GameScreen(),
      home: HomePages(),
    );
  }
}

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tok Taac'),
      ),
      body: Center(
<<<<<<< HEAD
        child: Column(children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('1 vs 1')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GameScreen()),
                  //TODO: cambiare pagine di riferimento con quella con la AI
                );
              },
              child: Text('1 vs AI')),
        ]),
=======
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                  child: Text('1 vs 1')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GameScreen()),
                      //TODO: cambiare pagine di riferimento con quella con la AI
                    );
                  },
                  child: Text('1 vs AI')),
            ]),
>>>>>>> main
      ),
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

  Game game = Game(); //classe dart per la logica di gioco

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoeard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyan,
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

            Container(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardLenth ~/ 3,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(Game.boardLenth, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            //refresh the screen
                            //button repeat game

                            if (game.board![index] == '') {
                              setState(() {
                                game.board![index] = lastValue;

                                turn++;

                                gameOver =
                                    game.win(lastValue, index, scoreboard, 3);

                                if (gameOver) {
                                  result = '$lastValue WIN';
                                } else if (!gameOver && turn == 9) {
                                  result = 'DRAW';
                                  gameOver = true;
                                }

                                if (lastValue == 'X') {
                                  lastValue = 'O';
                                } else {
                                  lastValue = 'X';
                                }
                              });
                            }
                          },
                    child: Container(
                      width: Game.sizeBloc,
                      height: Game.sizeBloc,
                      decoration: BoxDecoration(
<<<<<<< HEAD
                          color: ConfColor.seaSerpent, //???>?
=======
                          color: Colors.black, //???>?
>>>>>>> main
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
<<<<<<< HEAD
                            color: game.board![index] == 'X'
                                ? Colors.amberAccent
                                : Colors.deepOrange,
                            fontSize: 64.0,
                          ),
=======
                              color: game.board![index] == 'X'
                                  ? Colors.amberAccent
                                  : Colors.deepOrange,
                              fontSize: 64.0,
                              fontFamily: 'Raleway'),
>>>>>>> main
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              result,
              style: TextStyle(color: ConfColor.black, fontSize: 54.0),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  //reset
                  game.board = Game.initGameBoeard();
                  lastValue = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                  scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                });
              },
              icon: Icon(Icons.replay),
              label: Text('RESTART'),
<<<<<<< HEAD
            )
=======
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePages()),
                );
              },
              icon: Icon(Icons.home),
              label: Text('HOME'),
            ),
>>>>>>> main
            // https://github.com/doctorcode9/Flutter-Tic-Tact-Toe-Game
            // TODO: make game class that will contains all data and method
          ]),
    );
  }
}
