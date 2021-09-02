import 'package:auth_sample/screens/home.dart';
import 'package:auth_sample/screens/register.dart';
import 'package:auth_sample/screens/reset.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: true,
            decoration: InputDecoration(hintText: 'Email'),
            onChanged: (value) {
              setState(() {
                email = value.trim();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
            onChanged: (value) {
              setState(() {
                password = value.trim();
              });
            },
          ),
        ),
        RawMaterialButton(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () => login(email, password),
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
            Navigator.pushNamed(context, RegisterScreen.id);
          },
          child: Text(' Not yet registered? Click here.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetScreen())),
                child: Text('Forgot password?'))
          ],
        )
      ]),
    );
  }

  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message!, gravity: ToastGravity.TOP);
    }
  }
}
