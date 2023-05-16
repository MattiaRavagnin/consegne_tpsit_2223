class Circolare {
  final String titolo;
  final String categoria;
  final String pubblicato;
  final String validoFino;
  final List<dynamic> allegati;
  final String documenti;
  final String id;

  const Circolare({
    required this.titolo,
    required this.categoria,
    required this.pubblicato,
    required this.validoFino,
    required this.allegati,
    required this.documenti,
    required this.id,
  });
}
