import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});
  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  late Timer timer;

  bool _isTicking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STOPWATCH"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$seconds Seconds",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton(
              onPressed: _isTicking ? null : _startTimer,
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white)),
              child: const Text("Start"),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: _isTicking ? _pauseTimer : null,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 31, 228, 38)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white)),
              child: const Text("Pause "),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: _isTicking ? _stopTimer : null,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white)),
              child: const Text("Stop"),
            ),
          ]),
        ],
      ),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    setState(() {
      seconds = 0;
      _isTicking = true;
    });
  }

  void _pauseTimer() {
    timer.cancel();
    _isTicking = false;
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      _isTicking = false;
    });
  }

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        ++seconds;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }
}
