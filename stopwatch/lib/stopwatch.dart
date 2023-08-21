import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0, milliseconds = 0;
  final laps = <int>[];
  late Timer timer;
  bool _isTicking = false;
  final double itemHeight = 60;
  final scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "STOPWATCH",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _buildCounter(BuildContext)),
            Expanded(child: _buildDisplayNew())
          ],
        ));
  }

  Widget _buildCounter(BuildContext) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildControl1(context),
          _buildControl2(context),
        ],
      ),
    );
  }

  Widget _buildControl1(BuildContext) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: _isTicking ? null : _startTimer,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: Text("START")),
      SizedBox(
        width: 20,
      ),
      ElevatedButton(
          onPressed: _isTicking ? _pauseTimer : null,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: Text("Pause")),
      SizedBox(
        width: 20,
      ),
      ElevatedButton(
          onPressed: _isTicking ? _resetTimer : null,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: Text("Reset")),
      SizedBox(
        width: 20,
      ),
    ]);
  }

  Widget _buildControl2(BuildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: _isTicking ? null : _resumeTimer,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: Text("Resume")),
        SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: _isTicking ? _stopTimer : null,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.orange),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: Text("STOP")),
        SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: _isTicking ? _lap : null,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            child: Text("LAPS")),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget _buildDisplay() {
    return ListView(
      children: [
        for (int i in laps)
          ListTile(
            title: Text(
              _secondsText(i),
            ),
          ),
      ],
    );
  }

  Widget _buildDisplayNew() {
    return Scrollbar(
      child: ListView.builder(
          controller: scrollBarController,
          itemExtent: itemHeight,
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final val = laps[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              title: Text('Lap ${index + 1}'),
              trailing: Text(
                _secondsText(val),
              ),
            );
          }),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      _isTicking = true;
      laps.clear();
    });
  }

  void _pauseTimer() {
    timer.cancel();
    setState(() {
      _isTicking = false;
    });
  }

  void _resumeTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      _isTicking = true;
    });
  }

  void _resetTimer() {
    setState(() {
      milliseconds = 0;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      milliseconds = 0;
      _isTicking = false;
    });
  }

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        //timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
        milliseconds += 100;
      });
    }
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    scrollBarController.animateTo(laps.length * itemHeight,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    if (seconds < 1) {
      return "$seconds Seconds";
    } else {
      return "$seconds Seconds";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //timer.cancel();
    super.dispose();
  }
//here _onclick, initiate, dispose are all members of the class
}
