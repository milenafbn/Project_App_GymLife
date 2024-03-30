import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymlife/screens/home.dart';
import 'firebase_options.dart';
import 'package:gymlife/screens/exercicio_tela.dart';
import 'package:gymlife/screens/autenticacao_tela.dart';
import 'package:gymlife/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RoteadorTela(),
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(), //observar a stream de usuário quando houver mudanças
      builder: (context, snapshot) {
        if (snapshot.hasData) { //se tiver informação o usuário está logado
          return HomePage(user: snapshot.data!); //passa o usuário logado para a tela home
        } else {
          return const AutenticacaoTela();
        }
      },
    );  //observa o stream e chama o builder
  }
}


