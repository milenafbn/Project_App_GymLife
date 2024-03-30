import 'package:flutter/material.dart';
import 'package:gymlife/components/decoration_campo.dart';
import 'package:gymlife/core/colors.dart';
import 'package:gymlife/core/snackbar.dart';
import 'package:gymlife/services/auth_service.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool entrar = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(161,88,196, 1), 
      body:
      Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: RadialGradient(
              colors: [Cores.primarylight, Cores.primary],
              center: Alignment.center,
              radius: 1.0,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/gym-white.png", height: 128),
                      const SizedBox(height: 16),
                      const Text("GymLife", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36, 
                        color: Colors.white,
                        
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: emailController,
                        decoration: getInputDecoration("E-mail"),
                        validator: (String? value){
                          if(value == null || value.isEmpty){
                            return "O campo de E-mail é obrigatório";
                          }
                          if(!value.contains("@") || !value.contains(".") ){
                            return "E-mail inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: senhaController,
                        decoration: getInputDecoration("Senha"),
                          obscureText: true,
                          validator: (String? value){
                            if(value == null || value.isEmpty){
                              return "O campo de Senha é obrigatório";
                            }
                            if(value.length < 3){
                              return "A senha é muito curta";
                            }
                            return null;
                          },
                          
                      ),
                      Visibility(visible: !entrar, child: 
                      Column(
                        children: [
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: getInputDecoration("Confirme Senha"),
                            obscureText: true,
                            validator: (String? value){
                              if(value == null || value.isEmpty){
                                return "O campo de Senha é obrigatório";
                              }
                              if(value.length < 3){
                                return "A senha é muito curta";
                              }
                              return null;
                            },
                            
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: nomeController,
                            decoration: getInputDecoration("Nome"),
                            validator: (String? value){
                              if(value == null || value.isEmpty){
                                return "O campo Nome é obrigatório";
                              }
                              if(value.length < 3){
                                return "O nome é muito curto";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      ),              
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Cores.primarydark,
                        ),
                        onPressed: enterButton, 
                        child: Text(style: const TextStyle(color: Colors.white),(entrar)? "Entrar" : "Cadastrar"),
                        
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            entrar = !entrar;
                          });
                        }, 
                        child: Text((entrar)? "Cadastre-se" : "Já tem uma conta? Entre", style: const TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  enterButton(){
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if(_formKey.currentState!.validate()){ //o validate testa todos os campos que tem 'validate'
      if(entrar){
        print("Entrada validada");
        _autenServico.entrarUsuario(email: email, senha: senha).then((String? erro) {
          if(erro != null){
            showSnackBar(context: context, text: erro);
          } 
        });
      } else {
        print("Cadastro validado");
        print("Nome: ${nomeController.text}, E-mail: ${emailController.text}, Senha: ${senhaController.text};");
      
        _autenServico.cadastrarUsuario(nome: nome, email: email, senha: senha)
          .then((String? erro) { //depois de cadastrar o usuário ENTÃO (then) ele faz o que está dentro do then
            if(erro != null){
              //erro
              showSnackBar(context: context, text: erro);
            } else {
              //sucesso
              showSnackBar(context: context, text: "Usuário cadastrado com sucesso", isErro: false);
              // _formKey.currentState!.reset(); // Limpar o formulário
              // nomeController.clear();
              // emailController.clear();
              // senhaController.clear();
            }
          }
        );
      } 
    } else {
      print("form invalido");
    }
  }
}

