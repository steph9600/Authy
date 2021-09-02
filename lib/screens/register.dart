import 'package:auth_sample/screens/home.dart';
import 'package:auth_sample/screens/login.dart';
import 'package:auth_sample/screens/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'Register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                email = value.trim();
              });
            },
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: true,
            decoration: InputDecoration(hintText: 'Email'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                password = value.trim();
              });
            },
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
          ),
        ),
        RawMaterialButton(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () => register(email, password),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          elevation: 6.0,
          constraints: BoxConstraints.tightFor(
            height: 30.0,
          ),
          shape: RoundedRectangleBorder(),
          fillColor: Colors.yellowAccent,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.id);
          },
          child: Text(' Already Registered? Login here.'),
        )
      ]),
    );
  }

  register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacementNamed(context, VerifyScreen.id);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message!, gravity: ToastGravity.TOP);
    }
  }
}
