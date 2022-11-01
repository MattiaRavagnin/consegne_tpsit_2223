import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';
import 'package:tik_tok_taac_flutter/pages/game/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tik Tok Taac'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: AnimatedBackground(
          behaviour: RacingLinesBehaviour(),
          vsync: this,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('1 vs 1'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(300, 80),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                      elevation: 15,
                      shadowColor: Colors.yellow),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text('1 vs IA'),
                  onPressed: () {
                    //Navigator.of(context).push(
                    //  MaterialPageRoute(builder: (context) => ),
                    //); //inserire classe con la "IA"
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(300, 80),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                      elevation: 15,
                      shadowColor: Colors.yellow),
                ),
              ],
            ),
          )),
    );
  }
}
