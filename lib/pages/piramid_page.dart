import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  TextEditingController sisi = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  final Color cutePink = Color(0xFFFFB6C1);
  final Color softPink = Color(0xFFFFE4E1);
  final Color deepPink = Color(0xFFFF69B4);

  double luas = 0;
  double volume = 0;
  bool sudahHitung = false;

  void hitung() {
    double? s = double.tryParse(sisi.text);
    double? t = double.tryParse(tinggi.text);

    if (s == null || t == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Masukkan angka yang bener ya manis~ ✨")),
      );
      return;
    }

    setState(() {
      luas = s * s;
      volume = (1 / 3) * luas * t;
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
          "Bangun Piramid ✨",
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
            // Kartu Input
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
                  Icon(Icons.change_history_rounded, color: cutePink, size: 50),
                  SizedBox(height: 10),
                  Text(
                    "Masukkan ukuran piramidnya ya~",
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    sisi,
                    "Panjang Sisi Alas (contoh: 10.5)",
                    Icons.square_foot_rounded,
                  ),
                  SizedBox(height: 15),
                  _buildTextField(
                    tinggi,
                    "Tinggi Piramid (contoh: 15.2)",
                    Icons.height_rounded,
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: hitung,
              icon: Icon(Icons.auto_fix_high_rounded, color: Colors.white),
              label: Text(
                "HITUNG SEKARANG ✨",
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

            SizedBox(height: 30),

            if (sudahHitung)
              Column(
                children: [
                  _buildResultCard(
                    "Luas Alas",
                    luas.toStringAsFixed(2),
                    Icons.aspect_ratio_rounded,
                  ),
                  SizedBox(height: 15),
                  _buildResultCard(
                    "Volume",
                    volume.toStringAsFixed(2),
                    Icons.view_in_ar_rounded,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: cutePink),
        prefixIcon: Icon(icon, color: cutePink),
        filled: true,
        fillColor: softPink.withValues(alpha:0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
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
