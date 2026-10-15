import 'package:flutter/material.dart';
import '../modelos/numeros_modelos.dart';
import '../controladores/numeros_controladores.dart';

class SumaPantalla extends StatefulWidget {
  const SumaPantalla({super.key});

  @override
  State<SumaPantalla> createState() => _SumaPantallaState();
}

class _SumaPantallaState extends State<SumaPantalla> {
  NumerosControladores controlador = NumerosControladores();
  final numeroController = TextEditingController();

  String suma = '0';
  String paridad = '';
  String mensaje = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text.trim());

    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo';
        suma = '0';
        paridad = '';
      });
      return;
    }

    NumerosModelos datos = controlador.sumarDigitos(numero);

    setState(() {
      suma = datos.suma.toString();
      paridad = datos.paridad;
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      suma = '0';
      paridad = '';
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
        title: Text('Ejercicio 9: Suma'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Suma de dígitos',
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
                    leading: Icon(Icons.add, color: Colors.teal),
                    title: Text('Suma de los dígitos'),
                    trailing: Text(suma),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.teal),
                    title: Text('El resultado es'),
                    trailing: Text(paridad),
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
