import 'package:flutter/material.dart';
import 'package:projeto_app_academia/screens/exercicio_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExercicioTela(),
    );
  }
}


