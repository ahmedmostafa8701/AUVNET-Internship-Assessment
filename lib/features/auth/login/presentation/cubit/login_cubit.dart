import 'package:auvnet_internship_assessment/features/auth/login/data/apis/login_firebase.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repositories/login_repo.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  LoginRepository loginRepository = LoginFirebase();
  void login() async{
    isLoading = true;
    try{
      int statusCode = await loginRepository.login(emailController.text, passwordController.text);
      if(statusCode == 200){
        emit(LoginSuccess('Login Successful'));
      }
      else{
        emit(LoginFailure('Login Failed'));
      }
    }catch(e){
      emit(LoginFailure('Login Failed'));
    }
    isLoading = false;
  }
}