// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String email = '';
  bool loggedIn = false;

  final _nameField = TextEditingController();
  final _emailField = TextEditingController();
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/bg.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Login Screen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  TextFormField(
                    controller: _nameField,
                    decoration: InputDecoration(
                        label: Text('Name'),
                        hintText: '',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _emailField,
                    decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Container(
                            width: 110,
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Container(
                            width: 110,
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
