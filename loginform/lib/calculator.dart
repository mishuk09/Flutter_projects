import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  labelText: 'Height',
                ),
              ),
              TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: 'Weight',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        result = int.parse(num1Controller.text) +
                            int.parse(num2Controller.text);
                        setState(() {});
                      },
                      child: Text(
                        'Calculate'
                        style: TextStyle(fontSize: 30),
                      )),
                ],
              ),
              Text(
                'Result $result',
                style: TextStyle(),
              )
            ],
          ),
        ));
  }
}
