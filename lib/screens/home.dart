import 'package:gymlife/core/inicio_modal.dart';
import 'package:gymlife/screens/exercicio_tela.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gymlife/services/auth_service.dart';
import 'package:gymlife/models/exercicio_modelo.dart';
import 'package:gymlife/services/exercicio_servico.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ExercicioServico servico = ExercicioServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus exercícios"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(backgroundImage: AssetImage("assets/gym-white.png")),
              accountName: Text((widget.user.displayName != null)
                ? widget.user.displayName!
                : ""), 
              accountEmail: Text(widget.user.email!)),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              dense: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('SignOut'),
              dense: true,
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            ),

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalInicio(context);
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(stream: servico.conectarStreamExercicios(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) { //verificar se a conexão está pronta
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty){
            List<ExercicioModel> listaExercicio = [];  //para cada documento no snapshot (na iteração abaixo), adicionar na lista

            for (var doc in snapshot.data!.docs){ //iterar sobre os documentos
              listaExercicio.add(ExercicioModel.fromMap(doc.data()));
            }

            return ListView(
              children: List.generate(
                listaExercicio.length, 
                (index) {
                  ExercicioModel exercicioModel = listaExercicio[index];
                  return ListTile(
                    title: Text(exercicioModel.nome),
                    subtitle: Text(exercicioModel.treino),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ExercicioTela(exercicioModel: exercicioModel),
                        )
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text("Nenhum exercício cadastrado"));
          }
        }
      },)
      

    );
  }
}


