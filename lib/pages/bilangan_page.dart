import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  @override
  _BilanganPageState createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  TextEditingController angka = TextEditingController();
  String hasil = "";

  bool isPrima(int n) {
    if (n <= 1) return false;
    for (int i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void cekBilangan() {
    int n = int.parse(angka.text);
    String ganjilGenap = n % 2 == 0 ? "Genap" : "Ganjil";
    String prima = isPrima(n) ? "Prima" : "Bukan Prima";

    setState(() {
      hasil = "$ganjilGenap , $prima";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Bilangan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: angka, keyboardType: TextInputType.number),
            ElevatedButton(onPressed: cekBilangan, child: Text("Cek")),
            Text(hasil)
          ],
        ),
      ),
    );
  }
}