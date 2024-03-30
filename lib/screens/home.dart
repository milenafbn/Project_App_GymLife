import 'package:gymlife/screens/exercicio_tela.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gymlife/services/auth_service.dart';
import 'package:gymlife/models/exercicio_modelo.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ExercicioModel> listaExercicios = [
    ExercicioModel(
      id: "1",
      nome: "Remada Baixa Supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa",
      urlImagem: "https://www.google.com.br"
    ),
    ExercicioModel(
      id: "2",
      nome: "Supino Reto",
      treino: "Treino A",
      comoFazer: "Deita e empurra",
      urlImagem: "https://www.google.com.br"
    ),
        ExercicioModel(
      id: "1",
      nome: "Agachamento",
      treino: "Treino A",
      comoFazer: "Agacha",
      urlImagem: "https://www.google.com.br"
    ),
    ExercicioModel(
      id: "2",
      nome: "Puxada Frontal",
      treino: "Treino B",
      comoFazer: "Puxa pra frente",
      urlImagem: "https://www.google.com.br"
    ),
    ExercicioModel(
      id: "1",
      nome: "Remada Alta",
      treino: "Treino B",
      comoFazer: "Segura a barra e puxa",
      urlImagem: "https://www.google.com.br"
    ),
    ExercicioModel(
      id: "2",
      nome: "Rosca com Halteres",
      treino: "Treino A",
      comoFazer: "Puxa rosca",
      urlImagem: "https://www.google.com.br"
    ),
  ];

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
          print("FAB clicado");
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: List.generate(
          listaExercicios.length, 
          (index) {
            ExercicioModel exercicioModel = listaExercicios[index];
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
      ),
    );
  }
}


