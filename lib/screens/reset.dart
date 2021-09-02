import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  static const String id = 'Reset';

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
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
        RawMaterialButton(
          child: Text(
            'Send Request',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            auth.sendPasswordResetEmail(email: email);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A password reset email has been sent to $email'),
              ),
            );
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          elevation: 6.0,
          constraints: BoxConstraints.tightFor(
            height: 30.0,
          ),
          shape: RoundedRectangleBorder(),
          fillColor: Colors.yellowAccent,
        ),
      ]),
    );
  }
}
