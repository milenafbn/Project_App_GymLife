import 'package:flutter/material.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool entrar = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(161,88,196, 1), 
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/logo.png", height: 128),
                  const Text("HansenApp Saúde", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36, 
                    color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "E-mail"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Senha"
                    ),
                      obscureText: true,
                  ),
                  Visibility(visible: !entrar, child: 
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Confirmar Senha"
                        ),
                        obscureText: true,
                      ),
                      TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Nome"
                        ),
                      ),
                    ],
                  ),
                  ),              
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text((entrar)? "Entrar" : "Cadastrar"),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        entrar = !entrar;
                      });
                    }, 
                    child: Text((entrar)? "Cadastre-se" : "Já tem uma conta? Entre", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

