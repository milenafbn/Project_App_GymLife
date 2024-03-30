import 'package:flutter/material.dart';
import 'package:gymlife/components/decoration_campo.dart';
import 'package:gymlife/core/colors.dart';
import 'package:gymlife/models/exercicio_modelo.dart';
import 'package:gymlife/models/sentimento_model.dart';
import 'package:gymlife/services/exercicio_servico.dart';
import 'package:uuid/uuid.dart';

showModalInicio(BuildContext context) {
  showModalBottomSheet(
    context: context, 
    backgroundColor: Cores.primary,
    isDismissible: false, //não fecha ao clicar fora
    isScrollControlled: true, //permite scroll
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return const ExercicioModal();
    },
  
  );
}

class ExercicioModal extends StatefulWidget {
  const ExercicioModal({super.key});

  @override
  State<ExercicioModal> createState() => _ExercicioModalState();
}

class _ExercicioModalState extends State<ExercicioModal> {
  TextEditingController _nomeCtrl = TextEditingController();
  TextEditingController _treinoCtrl = TextEditingController();
  TextEditingController _comoFazerCtrl = TextEditingController();
  TextEditingController _sentimentoCtrl = TextEditingController();

  bool isLoading = false;

  ExercicioServico _exercicioServico = ExercicioServico(); //instancia do serviço

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      height: MediaQuery.of(context).size.height * 0.9, //define o tamanho do modal

      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column( //column criada apenas para resolver o problema do Divider que ficou no meio do modal por causa do spaceBetween 
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adicionar Exercicio", 
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              const Divider(),
              const SizedBox(height: 30),
              Column(
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nomeCtrl,
                  decoration: getInputDecoration(
                    "Qual o nome do exercício?",
                    // icon: const Icon(Icons.abc, color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _treinoCtrl,
                  decoration: getInputDecoration("Qual o treino? (A, B, C...)"
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _comoFazerCtrl,
                  decoration: getInputDecoration("Como fazer o exercício?"),
                  maxLines: null,

                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _sentimentoCtrl,
                  decoration: getInputDecoration("O que você está sentindo?"),
                  maxLines: null,
                ),
              ],
            ),
              ],
            ),

            ElevatedButton(onPressed: (){
              enviarExercicio();
            }, 
            child: 
            (isLoading)? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ) : const Text("Criar Exercício")
            ),],
      )),
    );
  }

  enviarExercicio(){
    setState(() {
      isLoading = true;
    });

    String nome = _nomeCtrl.text;
    String treino = _treinoCtrl.text;
    String comoFazer = _comoFazerCtrl.text;
    String sentindo = _sentimentoCtrl.text;

    ExercicioModel exercicio = ExercicioModel(
      id: const Uuid().v1(),
      nome: nome,
      treino: treino,
      comoFazer: comoFazer,
    );

    _exercicioServico.addExercicio(exercicio).then((value) {
      if (sentindo.isEmpty) {
        Navigator.pop(context);
      } else {
        SentimentoModel sentimento = SentimentoModel(
          id: const Uuid().v1(),
          sentindo: sentindo,
          data: DateTime.now().toString(),
        );

        _exercicioServico.addSentimento(exercicio.id, sentimento).then((value) {
          setState(() {
            isLoading = false;
          });
          Navigator.pop(context);
        });
      }
    });
  }
}