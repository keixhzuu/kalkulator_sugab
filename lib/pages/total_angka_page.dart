import 'package:flutter/material.dart';

class TotalAngka extends StatefulWidget {
  const TotalAngka({super.key});
  @override
  State<TotalAngka> createState() => _TotalAngkaState();
}

class _TotalAngkaState extends State<TotalAngka> {
  TextEditingController angka = TextEditingController();
  int total = 0;
  bool sudahHitung = false;

  final Color cutePink = Color(0xFFFFB6C1);
  final Color softPink = Color(0xFFFFE4E1);
  final Color deepPink = Color(0xFFFF69B4);

  void hitung() {
    if (angka.text.isEmpty) return;

    String input = angka.text;

    if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("3Masukkan angka saja tanpa koma atau huruf"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    int sum = 0;

    for (int i = 0; i < input.length; i++) {
      int digit = int.parse(input[i]);
      sum += digit;
    }

    setState(() {
      total = sum;
      sudahHitung = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softPink,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Hitung Angka Cantik ✨",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: cutePink,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: cutePink.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.auto_awesome_rounded, color: cutePink, size: 50),
                  SizedBox(height: 15),
                  Text(
                    "Tulis angka di sini,\nnanti aku bantu jumlahin yaa~",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: angka,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    decoration: InputDecoration(
                      hintText: "ketik di sini...",
                      hintStyle: TextStyle(
                        color: cutePink.withValues(alpha: 0.5),
                      ),
                      filled: true,
                      fillColor: softPink.withValues(alpha: 0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: hitung,
              icon: Icon(Icons.auto_awesome_rounded, color: Colors.white),
              label: Text(
                "HITUNG SEKARANG",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: deepPink,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: StadiumBorder(),
                elevation: 5,
              ),
            ),

            SizedBox(height: 40),

            if (sudahHitung) _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cutePink, deepPink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: deepPink.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "TARAA! INI HASILNYA 🧸",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$total",
            style: TextStyle(
              fontSize: 55,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Icon(Icons.stars_rounded, color: Colors.white, size: 25),
        ],
      ),
    );
  }
}
