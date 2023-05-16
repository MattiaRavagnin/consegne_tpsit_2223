import 'package:flutter/material.dart';

class Notizia {
  final String titolo;
  final String sito;
  final String pubblicazione;
  final String paragrafo;

  const Notizia({
    required this.titolo,
    required this.sito,
    required this.pubblicazione,
    required this.paragrafo,
    required immagini,
  });
}
