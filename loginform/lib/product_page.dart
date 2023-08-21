import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernmController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  String msg = 'initial values';
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: usernmController,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            
             
        ));
  }
}
