import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final Stopwatch stopwatch = Stopwatch();
  Timer? timer; // Menggunakan nullable agar lebih aman

  // Warna tema imut aesthetic
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
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel(); // Membersihkan timer saat halaman ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayTime = formatTime(stopwatch.elapsedMilliseconds);

    return Scaffold(
      backgroundColor: softPink,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilan Lingkaran Stopwatch
            Container(
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

            const SizedBox(height: 50),

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
                  label: "Berhenti",
                  icon: Icons.stop_rounded,
                  color: deepPink,
                ),
                const SizedBox(width: 15),
                _buildActionButton(
                  onPressed: reset,
                  label: "Ulang",
                  icon: Icons.refresh_rounded,
                  color: Colors.orange[300]!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk tombol yang estetik
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
