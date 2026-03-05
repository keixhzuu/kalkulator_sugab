import 'package:flutter/material.dart';

class TotalAngka extends StatefulWidget {
  @override
  _TotalAngkaState createState() => _TotalAngkaState();
}

class _TotalAngkaState extends State<TotalAngka> {
  TextEditingController angka = TextEditingController();
  int total = 0;

  void hitung() {
    String input = angka.text;
    int sum = 0;

    for (int i = 0; i < input.length; i++) {
      sum += int.parse(input[i]);
    }

    setState(() {
      total = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jumlah Total Angka")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: angka, keyboardType: TextInputType.number),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            Text("Total: $total")
          ],
        ),
      ),
    );
  }
}