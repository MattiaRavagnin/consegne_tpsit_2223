import 'package:flutter/material.dart';
import 'package:zuccapp/pages/calendario.dart';
import 'package:zuccapp/pages/libri.dart';

import 'package:zuccapp/pages/scuola.dart';
import 'package:zuccapp/pages/offerta_formativa.dart';
import 'package:zuccapp/pages/sicurezza.dart';
import 'package:zuccapp/pages/segreteria.dart';
import 'package:zuccapp/pages/news.dart';
import 'package:zuccapp/pages/circolari.dart';
import 'package:zuccapp/pages/info.dart';

import 'package:zuccapp/pages/orario.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Angoli rotondi
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7), // Colore dell'ombra
                      spreadRadius: 2, // Raggio di diffusione dell'ombra
                      blurRadius: 5, // Raggio di sfocatura dell'ombra
                      offset: Offset(0, 3), // Spostamento dell'ombra
                    ),
                  ],
                ), // Margine su tutti i lati
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Angoli rotondi
                  child: Image.asset(
                      'images/zuccante_triennio.jpg'), // Immagine da visualizzare
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.7), // Colore dell'ombra
                            spreadRadius: 2, // Raggio di diffusione dell'ombra
                            blurRadius: 5, // Raggio di sfocatura dell'ombra
                            offset: Offset(0, 3), // Spostamento dell'ombra
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          const url =
                              'https://www.itiszuccante.edu.it/calendario-scolastico';
                          // ignore: deprecated_member_use
                          if (await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.calendar_month), // <-- Icon
                            Text("Calendario"), // <-- Text
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.7), // Colore dell'ombra
                            spreadRadius: 2, // Raggio di diffusione dell'ombra
                            blurRadius: 5, // Raggio di sfocatura dell'ombra
                            offset: Offset(0, 3), // Spostamento dell'ombra
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          const url =
                              'https://www.itiszuccante.edu.it/sites/default/files/page/2022/classi_dal_28_novembre.pdf';
                          // ignore: deprecated_member_use
                          if (await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.lock_clock_outlined), // <-- Icon
                            Text("Orario"), // <-- Text
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.7), // Colore dell'ombra
                            spreadRadius: 2, // Raggio di diffusione dell'ombra
                            blurRadius: 5, // Raggio di sfocatura dell'ombra
                            offset: Offset(0, 3), // Spostamento dell'ombra
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          const url =
                              'https://www.itiszuccante.edu.it/sites/default/files/page/2022/libri_di_testo_a.s._2022-23.pdf';
                          // ignore: deprecated_member_use
                          if (await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.book_online_outlined), // <-- Icon
                            Text("Libri di Testo"), // <-- Text
                          ],
                        ),
                      ),
                    ),

                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => Sicurezza()),
                    //   );
                    // },
                  ],
                ),
              ),
              Text("ITIS Carlo Zuccante App - Ravagnin Mattia")
            ],
          ),
        ));
  }
}
