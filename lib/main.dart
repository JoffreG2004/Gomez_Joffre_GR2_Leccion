import 'package:flutter/material.dart';
import 'vistas/inicio_pantalla.dart';
import 'vistas/inversion_pantalla.dart';
import 'vistas/suma_pantalla.dart';
import 'vistas/divisores_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leccion1.1 Gomez Joffre GR2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const InicioPantalla(),
      routes: {
        '/inversion': (context) => const InversionPantalla(),
        '/suma': (context) => const SumaPantalla(),
        '/divisores': (context) => const DivisoresPantalla(),
      },
    );
  }
}
