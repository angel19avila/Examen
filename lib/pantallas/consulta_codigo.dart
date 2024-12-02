import 'package:flutter/material.dart';
import '../constantes/pais_service.dart';

class ConsultaCodigo extends StatefulWidget {
  @override
  _ConsultaCodigoState createState() => _ConsultaCodigoState();
}

class _ConsultaCodigoState extends State<ConsultaCodigo> {
  final _paisService = PaisService();
  final _controller = TextEditingController();
  String _resultado = '';

  Future<void> _buscarCodigo() async {
    try {
      final pais = await _paisService.buscarPorCodigo(_controller.text);
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
      appBar: AppBar(title: Text('Consulta por Codigo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Codigo del pais'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buscarCodigo,
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
