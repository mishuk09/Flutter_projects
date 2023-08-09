import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  TextStyle heading = TextStyle(fontSize: 24, color: Colors.deepPurple);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            height: 200,
          ),
          Text(
            "Recent",
            style: heading,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  color: Colors.grey,
                  height: 80,
                  width: 80,
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals",
                style: heading,
              ),
              Text(
                "View All",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  color: Colors.grey,
                  height: 80,
                  width: 80,
                )
            ],
          )
        ],
      ),
    );
  }
}
