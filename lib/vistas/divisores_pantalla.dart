import 'package:flutter/material.dart';
import '../modelos/numeros_modelos.dart';
import '../controladores/numeros_controladores.dart';

class DivisoresPantalla extends StatefulWidget {
  const DivisoresPantalla({super.key});

  @override
  State<DivisoresPantalla> createState() => _DivisoresPantallaState();
}

class _DivisoresPantallaState extends State<DivisoresPantalla> {
  NumerosControladores controlador = NumerosControladores();
  final numeroController = TextEditingController();

  String divisores = '';
  String cantidad = '0';
  String mensaje = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text.trim());

    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un número entero positivo';
        divisores = '';
        cantidad = '0';
      });
      return;
    }

    NumerosModelos datos = controlador.calcularDivisores(numero);

    setState(() {
      divisores = datos.divisores;
      cantidad = datos.cantidadDivisores.toString();
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      divisores = '';
      cantidad = '0';
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
        title: Text('Ejercicio 7: Divisores'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Divisores de un número',
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
                      leading: Icon(Icons.format_list_numbered, color: Colors.teal),
                      title: Text('Divisores'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(divisores),
                    ),
                    ListTile(
                      leading: Icon(Icons.calculate, color: Colors.teal),
                      title: Text('Cantidad de divisores'),
                      trailing: Text(cantidad),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiar,
        child: Icon(Icons.clear),
      ),
    );
  }
}
