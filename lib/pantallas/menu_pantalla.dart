import 'package:flutter/material.dart';
import 'consulta_nombre.dart'; // Asegúrate de importar la pantalla
import 'consulta_codigo.dart'; // Asegúrate de importar la pantalla

class MenuPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Container(
        color: Colors.lightBlue, // Cambia el color al que prefieras
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido al Menú Principal',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultaNombre(), // Navega a la pantalla de consulta por nombre
                    ),
                  );
                },
                child: Text('Consulta por Nombre'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultaCodigo(), // Navega a la pantalla de consulta por código
                    ),
                  );
                },
                child: Text('Consulta por Código'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
