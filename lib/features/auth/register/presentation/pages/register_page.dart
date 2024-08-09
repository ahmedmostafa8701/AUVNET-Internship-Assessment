import 'package:auvnet_internship_assessment/core/presentation/responsive.dart';
import 'package:auvnet_internship_assessment/core/presentation/widgets/app_bar.dart';
import 'package:auvnet_internship_assessment/core/presentation/widgets/secondary_choice_widget.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/pages/login_page.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/widgets/custom_button.dart';
import 'package:auvnet_internship_assessment/features/auth/login/presentation/widgets/email_input_field.dart';
import 'package:auvnet_internship_assessment/features/auth/register/presentation/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/text_sizes.dart';
import '../../../login/presentation/cubit/login_state.dart';
import '../../../login/presentation/widgets/password_input_field.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: CustomAppBar.buildAppBar(title: 'Register'),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: responsiveHeight(130), bottom: responsiveHeight(40)),
                      child: EmailInputField(
                        controller: BlocProvider.of<RegisterCubit>(context).emailController,
                      ),
                    ),
                    PasswordInputField(
                      controller: BlocProvider.of<RegisterCubit>(context).passwordController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: responsiveHeight(40), bottom: responsiveHeight(60)),
                      child: PasswordInputField(
                        hintText: 'Re-Password',
                        controller: BlocProvider.of<RegisterCubit>(context).rePasswordController,
                      ),
                    ),
                    CustomButton(
                      text: 'Register',
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        BlocProvider.of<RegisterCubit>(context).register();
                      },
                    ),
                    SizedBox(
                      height: responsiveHeight(30),
                    ),
                    SecondaryChoiceWidget(
                      question: 'Already have an account?',
                      choice: 'Login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state is RegisterSuccess){
              HelperFunctions.showSuccessToast(context: context, title: Text(state.message));
            }
            else if(state is RegisterFailure){
              HelperFunctions.showErrorToast(context: context, title: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}
