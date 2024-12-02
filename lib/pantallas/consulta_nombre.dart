import 'package:flutter/material.dart';
import '../constantes/pais_service.dart';

class ConsultaNombre extends StatefulWidget {
  @override
  _ConsultaNombreState createState() => _ConsultaNombreState();
}

class _ConsultaNombreState extends State<ConsultaNombre> {
  final _paisService = PaisService();
  final _controller = TextEditingController();
  String _resultado = '';

  Future<void> _buscarPais() async {
    try {
      final pais = await _paisService.buscarPorNombre(_controller.text);
      setState(() {
        _resultado = '''
        Nombre común: ${pais['name']['common']}
        Nombre oficial: ${pais['name']['official']}
        TLD: ${pais['tld']}
        CCA2: ${pais['cca2']}
        CCA3: ${pais['cca3']}
        ''';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta por Nombre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nombre del pais'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buscarPais,
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
