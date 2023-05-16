import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zuccapp/homepage.dart';
import 'package:zuccapp/pages/circolari.dart';
import 'package:zuccapp/pages/info.dart';
import 'package:zuccapp/pages/news.dart';
import 'package:zuccapp/pages/scuola.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: Icon(Icons.accessible_forward_rounded),
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
    );
  }
}
