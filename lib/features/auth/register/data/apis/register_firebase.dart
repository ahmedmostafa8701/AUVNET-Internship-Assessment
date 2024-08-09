import 'package:auvnet_internship_assessment/features/auth/login/domain/repositories/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/register_repo.dart';

class RegisterFirebase extends RegisterRepository{
  @override
  Future<int> register(String email, String password) async{
    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user != null ? 201 : 401;
  }
}