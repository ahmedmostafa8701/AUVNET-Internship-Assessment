import 'package:auvnet_internship_assessment/features/auth/login/data/apis/login_firebase.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/cubit/login_state.dart';
import 'package:auvnet_internship_assessment/features/auth/register/presentation/cubit/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../data/apis/register_firebase.dart';
import '../../domain/repositories/register_repo.dart';


class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool isLoading = false;
  RegisterRepository registerRepository = RegisterFirebase();
  void register() async{
    if(passwordController.text != rePasswordController.text){
      emit(RegisterFailure('Passwords do not match'));
      return;
    }
    isLoading = true;
    try{
      int statusCode = await registerRepository.register(emailController.text, passwordController.text);
      if(statusCode == 201){
        emit(RegisterSuccess('Register Successful'));
      }
      else{
        emit(RegisterFailure('Register Failed'));
      }
    }catch(e){
      emit(RegisterFailure('Register Failed'));
    }
    isLoading = false;
  }
}