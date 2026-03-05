import 'package:flutter/material.dart';
import 'data_kelompok_page.dart';
import 'kalkulator_page.dart';
import 'bilangan_page.dart';
import 'total_angka_page.dart';
import 'stopwatch_page.dart';
import 'piramid_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Utama")),
      body: ListView(
        children: [
          menuButton(context, "Data Kelompok", DataKelompok()),
          menuButton(context, "Penjumlahan & Pengurangan", KalkulatorPage()),
          menuButton(context, "Bilangan Ganjil/Genap & Prima", BilanganPage()),
          menuButton(context, "Jumlah Total Angka", TotalAngka()),
          menuButton(context, "Stopwatch", StopwatchPage()),
          menuButton(context, "Luas & Volume Piramid", PiramidPage()),
        ],
      ),
    );
  }

  Widget menuButton(context, title, page) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}