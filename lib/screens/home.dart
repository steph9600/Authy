import 'package:auth_sample/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'Home';

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Home'),
      ),
      body: Center(
        child: RawMaterialButton(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            auth.signOut();
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          },
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          elevation: 6.0,
          constraints: BoxConstraints.tightFor(
            height: 30.0,
          ),
          shape: RoundedRectangleBorder(),
          fillColor: Colors.yellowAccent,
        ),
      ),
    );
  }
}
