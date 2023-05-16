import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:zuccapp/homepage.dart';
import 'package:zuccapp/pages/scuola.dart';
import 'package:zuccapp/pages/offerta_formativa.dart';
import 'package:zuccapp/pages/sicurezza.dart';
import 'package:zuccapp/pages/segreteria.dart';
import 'package:zuccapp/pages/news.dart';
import 'package:zuccapp/pages/circolari.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zuccapp'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(1, 87, 155, 1)),
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
              onTap: () async {
                const url =
                    'https://www.itiszuccante.edu.it/menu-principale/l-istituto';
                // ignore: deprecated_member_use
                if (await canLaunch(url)) {
                  // ignore: deprecated_member_use
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.circle_notifications_outlined),
              title: Text('Offerta formativa'),
              onTap: () async {
                const url =
                    'https://www.itiszuccante.edu.it/sites/default/files/page/2023/ptof-2022-2025-pubblicato.pdf';
                // ignore: deprecated_member_use
                if (await canLaunch(url)) {
                  // ignore: deprecated_member_use
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },

              //() {
              //  Navigator.of(context).push(
              //    MaterialPageRoute(builder: (context) => OF()),
              //  );
              //},
            ),
            ListTile(
              leading: Icon(Icons.adf_scanner_rounded),
              title: Text('Segreteria - URP'),
              onTap: () async {
                const url =
                    'https://www.itiszuccante.edu.it/menu-principale/orari-di-apertura';
                // ignore: deprecated_member_use
                if (await canLaunch(url)) {
                  // ignore: deprecated_member_use
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
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
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50.00,
              ),
              Container(
                width: 300.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sede Centrale',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Via Baglioni, n. 22\n30173 Mestre (VE)\nTel.: 041-5341046\nFax: 041-5341472',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.00,
              ),
              Container(
                width: 300.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sede Biennio',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Via Cattaneo, n. 3\n30173 Mestre (VE)\nTel.: 041-950960\nFax: 041-5058416',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.00,
              ),
              Container(
                width: 300.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contatti',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E-mail: vetf04000t@istruzione.it\nPEC: vetf04000t@pec.istruzione.it\nCod. Fisc.: 82005200272\nCodice iPA: istsc_vetf04000t\nCod. Mecc.: vetf04000t',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
