import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import 'package:zuccapp/components/newsComponent.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Notizia> notizie = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://www.itiszuccante.edu.it/categoria/news");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final elements = html.querySelectorAll('.views-row');

    var news = [];

    for (final element in elements) {
      final titleElement = element.querySelector('.field-content > h1');
      final title = titleElement?.text ?? '';

      final imageElement = element.querySelector('.views-field-body img');
      final imageUrl = imageElement?.attributes['src'] ?? '';

      final dateElement =
          element.querySelector('.views-field-created .field-content');
      final date = dateElement?.text ?? '';

      final bodyElement = element.querySelector('.views-field-body')!;
      final paragrafo = bodyElement
          .getElementsByTagName('p')
          .map((p) => p.text.trim())
          .join('\n');

      final urlElement = element.querySelector('.views-field-view-node a');
      final url = urlElement?.attributes['href'];

      news.add({
        'titolo': title,
        'immagine': imageUrl,
        'data': date,
        'paragrafo': paragrafo,
        'url': url
      });
    }

    setState(() {
      notizie = List.generate(
        news.length,
        (index) => Notizia(
          titolo: news[index]['titolo'],
          immagini: news[index]['immagine'],
          sito: news[index]['url'],
          pubblicazione: news[index]['data'],
          paragrafo: news[index]['paragrafo'],
        ),
      );
    });
  }

  Future<void> _launcherUri(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("cant\'t launch url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News"),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Container(
        color: Colors.lightBlue[100],
        child: ListView.builder(
          itemCount: notizie.length,
          itemBuilder: (context, index) {
            final notizia = notizie[index];
            return GestureDetector(
              onTap: () {
                _launcherUri('https://www.itiszuccante.edu.it/${notizia.sito}');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightBlue[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          notizia.titolo,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          children: [
                            Text(
                              "\n${notizia.paragrafo}",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pubblicata il ${notizia.pubblicazione}",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
