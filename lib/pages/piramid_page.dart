import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  @override
  _PiramidPageState createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  TextEditingController sisi = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  double luas = 0;
  double volume = 0;

  void hitung() {
    double s = double.parse(sisi.text);
    double t = double.parse(tinggi.text);

    setState(() {
      luas = s * s;
      volume = (1 / 3) * luas * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Piramid")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: sisi, decoration: InputDecoration(labelText: "Sisi")),
            TextField(controller: tinggi, decoration: InputDecoration(labelText: "Tinggi")),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Luas: $luas"),
            Text("Volume: $volume"),
          ],
        ),
      ),
    );
  }
}