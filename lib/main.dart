import 'package:auvnet_internship_assessment/features/auth/login/presentation/pages/login_page.dart';
import 'package:auvnet_internship_assessment/routes.dart';
import 'package:auvnet_internship_assessment/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple E-Commerce App',
      routes: routes,
      initialRoute: LoginPage.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
      ),
    );
  }
}