import 'package:flutter/material.dart';

class ExercicioTela extends StatelessWidget {
  const ExercicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Puxada Alta Pronada - Treino A")),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          print("Botão pressionado");
        }, 
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {}, 
              child: const Text("Enviar foto"),
            ),
            const Text("Como fazer?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            const Text(
              "1. Segure a barra com as palmas das mãos voltadas para você e com as mãos afastadas na largura dos ombros."),
            const Divider(),
            const Text("Como estou me sentindo?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            const Text("Sentindo dor no ombro direito.")
          ],
        ),
      ),
    );
  }
}
