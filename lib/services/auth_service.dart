import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
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
} on FirebaseAuthException catch (e) {
  if (e.code == "email-already-in-use") {
    print("O e-mail já está em uso");
  } else if (e.code == "weak-password") {
    print("A senha é muito fraca");

  }
}
  }
}