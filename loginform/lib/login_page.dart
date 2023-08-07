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
            TextField(
              controller: pwdController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Passssword',
                prefix: Icon(Icons.key),
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
                hintText: 'password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(usernmController.text);
                  print(pwdController.text);

                  if (usernmController.text == pwdController.text)
                    msg = 'both are same';
                  else
                    msg = 'both are not same';
                  setState(() {});

                  print(msg);
                },
                child: Text('Login')),
            Text(msg),
          ]),
        ));
  }
}
