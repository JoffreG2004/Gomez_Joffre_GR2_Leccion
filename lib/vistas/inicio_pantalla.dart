import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo 2'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Ejercicios de números',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text('Seleccione el ejercicio que desea realizar'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/inversion');
              },
              icon: Icon(Icons.swap_horiz),
              label: Text('Ejercicio 8: Invertir número'),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/suma');
              },
              icon: Icon(Icons.add),
              label: Text('Ejercicio 9: Suma de dígitos'),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/divisores');
              },
              icon: Icon(Icons.format_list_numbered),
              label: Text('Ejercicio 7: Divisores'),
            ),
          ],
        ),
      ),
    );
  }
}
