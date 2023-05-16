import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zuccapp/homepage.dart';
import 'package:zuccapp/pages/info.dart';
import 'package:zuccapp/pages/scuola.dart';
import 'package:zuccapp/pages/offerta_formativa.dart';
import 'package:zuccapp/pages/sicurezza.dart';
import 'package:zuccapp/pages/segreteria.dart';
import 'package:zuccapp/pages/news.dart';
import 'package:zuccapp/pages/circolari.dart';

class Segreteria extends StatefulWidget {
  const Segreteria({Key? key}) : super(key: key);

  @override
  _SegreteriaState createState() => _SegreteriaState();
}

class _SegreteriaState extends State<Segreteria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zuccapp'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'C. Zuccante',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business_outlined),
              title: Text('La scuola'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Scuola()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.circle_notifications_outlined),
              title: Text('Offerta formativa'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OF()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outlined),
              title: Text('sicurezza'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Sicurezza()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.accessible_forward_rounded),
              title: Text('Segreteria - URP'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Segreteria()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper_outlined),
              title: Text('News'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => News()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feed_outlined),
              title: Text('Circolari'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Circolari()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Info'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Info()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
