import 'package:auvnet_internship_assessment/core/presentation/responsive.dart';
import 'package:auvnet_internship_assessment/core/presentation/widgets/app_bar.dart';
import 'package:auvnet_internship_assessment/core/presentation/widgets/loading_widget.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/cubit/login_state.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/widgets/password_input_field.dart';
import 'package:auvnet_internship_assessment/features/products/presentation/pages/product_page.dart';
import 'package:auvnet_internship_assessment/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions.dart';
import '../../../../../core/presentation/widgets/secondary_choice_widget.dart';
import '../../../../../styles/text_sizes.dart';
import '../cubit/login_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/email_input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: CustomAppBar.buildAppBar(title: 'Login Page'),
        body: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return LoadingWidget(
              isLoading: BlocProvider.of<LoginCubit>(context).isLoading,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: responsiveWidth(30)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: responsiveHeight(200), bottom: responsiveHeight(40)),
                        child: EmailInputField(
                          hintText: 'Email',
                          controller: BlocProvider.of<LoginCubit>(context).emailController,
                        ),
                      ),
                      PasswordInputField(
                        hintText: 'Password',
                        controller: BlocProvider.of<LoginCubit>(context).passwordController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: responsiveHeight(60), bottom: responsiveHeight(30)),
                        child: CustomButton(
                          text: 'Login',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<LoginCubit>(context).login();
                          },
                        ),
                      ),
                      SecondaryChoiceWidget(
                        question: 'Don\'t have an account?',
                        choice: 'Register',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state is LoginSuccess){
              HelperFunctions.showSuccessToast(context: context, title: Text(state.message));
              Navigator.pushReplacementNamed(context, ProductPage.routeName);
            }
            else if(state is LoginFailure){
              HelperFunctions.showErrorToast(context: context, title: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}