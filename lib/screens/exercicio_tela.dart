import 'package:flutter/material.dart';
import 'package:gymlife/models/exercicio_modelo.dart';
import 'package:gymlife/models/sentimento_model.dart';
import 'package:gymlife/core/colors.dart';
import 'package:gymlife/screens/home.dart';

class ExercicioTela extends StatelessWidget {
  final ExercicioModel exercicioModel;
  ExercicioTela({super.key, required this.exercicioModel});

  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel(
      id: "1",
      sentindo: "Dor no ombro direito",
      data: "2022-10-10"
    ),
    SentimentoModel(
      id: "2",
      sentindo: "Dor no ombro esquerdo",
      data: "2022-10-10"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
        Column(
          children: [
            Text(
              exercicioModel.nome,
              style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)
            ),
            Text(
                exercicioModel.treino,
              style: const TextStyle( fontSize: 15,)
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Cores.primarylight,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB clicado");
        },
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            Text(exercicioModel.comoFazer),
            const Divider(),
            const Text("Como estou me sentindo?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),

            //Listando os sentimentos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(listaSentimentos.length, (index) {
              SentimentoModel sentimento = listaSentimentos[index];
              return Text(sentimento.sentindo);
            }),
          ),
          ],
        ),
      ),
    );
  }
}
