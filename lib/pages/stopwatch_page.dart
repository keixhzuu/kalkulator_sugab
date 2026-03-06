import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  List<String> laps = [];

  // Warna tema
  final Color cutePink = const Color(0xFFFFB6C1);
  final Color softPink = const Color(0xFFFFE4E1);
  final Color deepPink = const Color(0xFFFF69B4);

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
    if (!stopwatch.isRunning) {
      stopwatch.start();
      startTimer();
    }
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
    setState(() {});
  }

  void reset() {
    stopwatch.reset();
    timer?.cancel();
    setState(() {
      laps.clear();
    });
  }

  void lap() {
    if (stopwatch.isRunning) {
      setState(() {
        laps.add(formatTime(stopwatch.elapsedMilliseconds));
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayTime = formatTime(stopwatch.elapsedMilliseconds);

    return Scaffold(
      backgroundColor: softPink,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Stopwatch ✨",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: cutePink,
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          // Lingkaran Stopwatch
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: cutePink.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(color: cutePink, width: 8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer_outlined, color: cutePink, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    displayTime,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    "menit : detik : ms",
                    style: TextStyle(color: Colors.brown[300], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Tombol Kontrol
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(
                onPressed: start,
                label: "Mulai",
                icon: Icons.play_arrow_rounded,
                color: Colors.green[300]!,
              ),
              const SizedBox(width: 15),
              _buildActionButton(
                onPressed: stop,
                label: "Stop",
                icon: Icons.stop_rounded,
                color: deepPink,
              ),
              const SizedBox(width: 15),
              _buildActionButton(
                onPressed: reset,
                label: "Reset",
                icon: Icons.refresh_rounded,
                color: Colors.orange[300]!,
              ),
              const SizedBox(width: 15),
              _buildActionButton(
                onPressed: lap,
                label: "Lap",
                icon: Icons.flag_rounded,
                color: Colors.blue[300]!,
              ),
            ],
          ),

          const SizedBox(height: 30),

          // List Lap Time
          Expanded(
            child: ListView.builder(
              itemCount: laps.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 30,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: cutePink),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lap ${index + 1}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                      Text(
                        laps[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[700],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget tombol
  Widget _buildActionButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            elevation: 5,
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.brown[600],
          ),
        ),
      ],
    );
  }
}
