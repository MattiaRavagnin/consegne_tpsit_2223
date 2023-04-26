import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scf_flutter/animation.dart';
import 'package:shake/shake.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:colorful_background/colorful_background.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int _selectedButtonIndex;

  String _result = "";
  String _computerChoice = "default";
  String _playerChoice = "default";
  int _score = 0;

  final List<String> choices = ["sasso", "carta", "forbice"];

  final _shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    super.initState();
    /* Shake detector implementation to handle phone shaking */
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _shakeKey.currentState?.shake();
      setState(() {
        _computerChoice = choices[Random().nextInt(choices.length)];
        //_playerChoice = choices[Random().nextInt(choices.length)];
        _result = getResult(_playerChoice, _computerChoice);
      });
    });
  }

  void _handleButtonTapped(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  void _ComputerChoosing() {
    Random random = new Random();

    int _computerChoice = random.nextInt(3);
    //print(_computerChoice);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text('SASSO CARTA FROCIO'),
        //),
        body: ColorfulBackground(
          duration: Duration(milliseconds: 1000),
          backgroundColors: [
            const Color(0xFFFF5ACD),
            const Color(0xFFFBDA61),
            const Color(0xFF00AB79),
            const Color(0xFFF7CE68),
            const Color(0xFFFF007D),
          ],
          child: Column(
            children: [
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'SASSO CARTA FORBICE',
                      style: GoogleFonts.righteous(fontSize: 30),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Computer Choice:',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ShakeWidget(
                          key: _shakeKey,
                          shakeCount: 3,
                          shakeOffset: 10,
                          shakeDuration: Duration(milliseconds: 500),
                          child: TextButton(
                            onPressed: () => {},
                            //color: _selectedButtonIndex == 0 ? Colors.blue : null,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/${_computerChoice}.png'),
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => {
                            _handleButtonTapped(0),
                            _playerChoice = choices[0],
                            print('sasso chose'),
                            print(_selectedButtonIndex)
                          },
                          //color: _selectedButtonIndex == 0 ? Colors.blue : null,
                          child: Image(
                            image: AssetImage(
                                'assets/images/${_playerChoice}.png'),
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Choice: ',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => {
                            _handleButtonTapped(0),
                            _playerChoice = choices[0],
                            print('sasso chose'),
                            print(_selectedButtonIndex)
                          },
                          //color: _selectedButtonIndex == 0 ? Colors.blue : null,
                          child: const Image(
                              image: AssetImage('assets/images/sasso.png')),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => {
                            _handleButtonTapped(1),
                            _playerChoice = choices[1],
                            print('carta chose'),
                            print(_selectedButtonIndex)
                          },
                          //color: _selectedButtonIndex == 1 ? Colors.blue : null,
                          child: const Image(
                              image: AssetImage('assets/images/carta.png')),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => {
                            _handleButtonTapped(2),
                            _playerChoice = choices[2],
                            print('forbice chose'),
                            print(_selectedButtonIndex)
                          },
                          //color: _selectedButtonIndex == 2 ? Colors.blue : null,
                          child: const Image(
                              image: AssetImage('assets/images/forbice.png')),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'SCORE: ${_score}',
                      style: GoogleFonts.righteous(fontSize: 30),
                    ),
                  ),
                  TextButton(
                    child: Text(''),
                    onPressed: () {
                      setState(() {
                        _computerChoice =
                            choices[Random().nextInt(choices.length)];
                        //_playerChoice = choices[Random().nextInt(choices.length)];
                        _result = getResult(_playerChoice, _computerChoice);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getResult(String playerChoice, String computerChoice) {
    if (playerChoice == '') {
      return 'Scegli!!';
    }
    if (playerChoice == computerChoice) {
      return "Pareggio!";
    } else if ((playerChoice == "sasso" && computerChoice == "forbice") ||
        (playerChoice == "carta" && computerChoice == "sasso") ||
        (playerChoice == "forbice" && computerChoice == "carta")) {
      _score++;
      return "Vittoria!";
    } else {
      return "Sconfitta!";
    }
  }
}
