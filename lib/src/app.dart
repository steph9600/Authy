import 'package:auth_sample/screens/home.dart';
import 'package:auth_sample/screens/login.dart';
import 'package:auth_sample/screens/register.dart';
import 'package:auth_sample/screens/verify.dart';
import 'package:flutter/material.dart';

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        VerifyScreen.id: (context) => VerifyScreen(),
      },
      home: LoginScreen(),
    );
  }
}
