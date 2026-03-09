import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
   State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  TextEditingController angka = TextEditingController();
  String hasilGanjilGenap = "";
  String hasilPrima = "";

  
  final Color cutePink = Color(0xFFFFB6C1);
  final Color softPink = Color(0xFFFFE4E1);
  final Color deepPink = Color(0xFFFF69B4);

  bool isPrima(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void cekBilangan() {
    if (angka.text.isEmpty) return;

    double n = double.parse(angka.text);

    setState(() {
      if(n % 1 != 0){
        hasilGanjilGenap = "Bilangan Desimal";
        hasilPrima = "Bilangan Desimal";

      }else {
        int bil = n.toInt();
        hasilGanjilGenap = bil % 2 == 0 ? "Bilangan Genap" : "Bilangan Ganjil";
        hasilPrima = isPrima(bil) ? "Bilangan Prima" : "Bukan Prima";

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softPink,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Cek Bilangan✨",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            // Container Input
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: cutePink.withValues(alpha:0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.auto_awesome_rounded, color: cutePink, size: 40),
                  Text(
                    "Masukkan angka 💫\nCek ganjil, genap, atau prima~",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: angka,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    decoration: InputDecoration(
                      hintText: "masukkan angka",
                      hintStyle: TextStyle(color: cutePink.withValues(alpha:0.5)),
                      filled: true,
                      fillColor: softPink.withValues(alpha:0.2),
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

            SizedBox(height: 25),

            // Tombol Cek
            ElevatedButton(
              onPressed: cekBilangan,
              style: ElevatedButton.styleFrom(
                backgroundColor: deepPink,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: StadiumBorder(),
                elevation: 5,
              ),
              child: Text(
                "CEK SEKARANG ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 30),

            // Tampilan Hasil (Hanya muncul jika sudah ada hasil)
            if (hasilGanjilGenap.isNotEmpty)
              Column(
                children: [
                  _buildResultCard(
                    "Status Ganjil/Genap",
                    hasilGanjilGenap,
                    Icons.looks_two_rounded,
                  ),
                  SizedBox(height: 15),
                  _buildResultCard(
                    "Status Prima",
                    hasilPrima,
                    Icons.star_rounded,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(String title, String value, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: cutePink, width: 2),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: softPink,
            child: Icon(icon, color: deepPink),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
