import 'package:flutter/material.dart';
import 'package:projeto_app_academia/models/exercicio_modelo.dart';
import 'package:projeto_app_academia/models/sentimento_model.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  //criando instancias dos models
  final ExercicioModel exercicio = ExercicioModel(
    id: "1",
    nome: "Remada Baixa Supinada",
    treino: "Treino A",
    comoFazer: "Segura a barra e puxa",
    urlImagem: "https://www.google.com.br"
  );

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
      appBar: AppBar(title: Text("${exercicio.nome} - ${exercicio.treino}")),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {}, 
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
            Text("${exercicio.comoFazer}"),
            const Divider(),
            const Text("Como estou me sentindo?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            Text("Sentindo dor no ombro direito.")
          ],
        ),
      ),
    );
  }
}
