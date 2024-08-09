import 'package:auvnet_internship_assessment/features/auth/login/domain/repositories/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFirebase extends LoginRepository{
  @override
  Future<int> login(String email, String password) async{
    var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return credential.user != null ? 200 : 401;
  }
}