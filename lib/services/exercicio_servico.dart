import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymlife/models/exercicio_modelo.dart';
import 'package:gymlife/models/sentimento_model.dart';

class ExercicioServico{
  //salvando informações de acordo com o id do usuario
  String userId;
  ExercicioServico() : userId = FirebaseAuth.instance.currentUser!.uid; //definir durante a inicialização do serviõ e não no construtor
  
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExercicio(ExercicioModel exercicioModel) async {
    return await _firestore
      .collection(userId)
      .doc(exercicioModel.id)
      .set(exercicioModel.toMap());
  }

  Future<void> addSentimento(String idExercicio, SentimentoModel sentimentoModel) async {
    return await _firestore
      .collection(userId)
      .doc(idExercicio)
      .collection("sentimentos")
      .doc(sentimentoModel.id)
      .set(sentimentoModel.toMap());
  }

  //metodo de leitura
  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamExercicios(){
    return _firestore.collection(userId).snapshots();
  }

}