import 'package:flutter/material.dart';
import '../modelos/numeros_modelos.dart';
import '../controladores/numeros_controladores.dart';

class InversionPantalla extends StatefulWidget {
  const InversionPantalla({super.key});

  @override
  State<InversionPantalla> createState() => _InversionPantallaState();
}

class _InversionPantallaState extends State<InversionPantalla> {
  NumerosControladores controlador = NumerosControladores();
  final numeroController = TextEditingController();

  String invertido = '0';
  String mensaje = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text.trim());

    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo';
        invertido = '0';
      });
      return;
    }

    NumerosModelos datos = controlador.invertir(numero);

    setState(() {
      invertido = datos.invertido.toString();
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      invertido = '0';
      mensaje = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 8: Inversión'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Inversión de un número',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número entero positivo',
                prefixIcon: Icon(Icons.numbers, color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: calcular,
                  icon: Icon(Icons.calculate),
                  label: Text('Calcular'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (mensaje.isNotEmpty)
              Text(mensaje, style: TextStyle(color: Colors.red)),
            Card(
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.swap_horiz, color: Colors.teal),
                    title: Text('Número invertido'),
                    trailing: Text(invertido),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiar,
        child: Icon(Icons.clear),
      ),
    );
  }
}
