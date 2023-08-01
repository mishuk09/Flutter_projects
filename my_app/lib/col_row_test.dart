import 'package:flutter/material.dart';

class ColRowTest extends StatelessWidget {
  const ColRowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Col row test'),
      ),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Mahadi Hasan Mishuk",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
        ),
        Text("21SOECE11649"),
        Text(
          "5CE-D",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ])),
    );
  }
}
