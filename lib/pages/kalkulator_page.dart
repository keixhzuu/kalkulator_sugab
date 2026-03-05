import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();

  String hasil = "";

  void tambah() {
    BigInt a = BigInt.parse(angka1.text);
    BigInt b = BigInt.parse(angka2.text);

    setState(() {
      hasil = (a + b).toString();
    });
  }

  void kurang() {
    BigInt a = BigInt.parse(angka1.text);
    BigInt b = BigInt.parse(angka2.text);

    setState(() {
      hasil = (a - b).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator Digit Besar")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: angka1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka pertama"),
            ),

            TextField(
              controller: angka2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka kedua"),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: tambah,
                  child: Text("Tambah"),
                ),

                ElevatedButton(
                  onPressed: kurang,
                  child: Text("Kurang"),
                ),

              ],
            ),

            SizedBox(height: 20),

            Text(
              "Hasil: $hasil",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}