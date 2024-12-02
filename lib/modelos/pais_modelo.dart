class Pais {
  final String nombreComun;
  final String nombreOficial;
  final List<String> dominios;
  final String codigoCca2;
  final String codigoCca3;

  Pais({
    required this.nombreComun,
    required this.nombreOficial,
    required this.dominios,
    required this.codigoCca2,
    required this.codigoCca3,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      nombreComun: json['name']['common'] ?? 'Desconocido',
      nombreOficial: json['name']['official'] ?? 'Desconocido',
      dominios: List<String>.from(json['tld'] ?? []),
      codigoCca2: json['cca2'] ?? 'Desconocido',
      codigoCca3: json['cca3'] ?? 'Desconocido',
    );
  }
}

