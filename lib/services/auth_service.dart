import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome, 
    required String email, 
    required String senha
    }) async {
      try {
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email, 
    password: senha
  );
  
  await userCredential.user!.updateDisplayName(nome);
  return null;
} on FirebaseAuthException catch (e) {
  if (e.code == "email-already-in-use") {
    return "O e-mail já está em uso";
    
  } else if (e.code == "weak-password") {
    print("A senha é muito fraca");
  }
  return "Erro desconhecido";
}
  }

  Future<String?> entrarUsuario({
    required String email, 
    required String senha
  }) async {
    try {
  await _firebaseAuth.signInWithEmailAndPassword(
    email: email, password: senha);
  return null;
} on FirebaseAuthException catch (e) { // 'e' captura o erro
  return e.message; 
  // TODO
}
  }

  Future<void> deslogar() async {
    await _firebaseAuth.signOut();
  }

}



