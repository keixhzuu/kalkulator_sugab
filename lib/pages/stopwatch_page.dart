import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  String formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, "0");
    String secondsStr = (seconds % 60).toString().padLeft(2, "0");
    String milliStr = (hundreds % 100).toString().padLeft(2, "0");

    return "$minutesStr:$secondsStr:$milliStr";
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void start() {
    stopwatch.start();
    startTimer();
  }

  void stop() {
    stopwatch.stop();
    timer.cancel();
  }

  void reset() {
    stopwatch.reset();
    timer.cancel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String displayTime = formatTime(stopwatch.elapsedMilliseconds);

    return Scaffold(
      appBar: AppBar(title: const Text("Stopwatch")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayTime,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: start, child: const Text("Start")),

                const SizedBox(width: 10),

                ElevatedButton(onPressed: stop, child: const Text("Stop")),

                const SizedBox(width: 10),

                ElevatedButton(onPressed: reset, child: const Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

