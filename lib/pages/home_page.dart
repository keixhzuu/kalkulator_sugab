import 'package:flutter/material.dart';
// Pastikan semua import ini sesuai dengan nama file kamu ya
import 'data_kelompok_page.dart';
import 'kalkulator_page.dart';
import 'bilangan_page.dart';
import 'total_angka_page.dart';
import 'stopwatch_page.dart';
import 'piramid_page.dart';
import 'login_page.dart'; // Ditambahkan untuk fungsi logout jika diperlukan

class HomePage extends StatelessWidget {
  // Definisi warna tema imut
  final Color cutePink = Color(0xFFFFB6C1);
  final Color softPink = Color(0xFFFFE4E1);
  final Color deepPink = Color(0xFFFF69B4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softPink, // Latar belakang pink lembut
      appBar: AppBar(
        title: Text("Menu Utama ✨", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: cutePink,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded, color: Colors.white),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Menu Favoritmu:",
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.brown[600]
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Menampilkan 2 kolom agar lebih manis
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  // Nama class (DataKelompok, KalkulatorPage, dll) tetap sama seperti kodinganmu
                  menuButton(context, "Data Kelompok", Icons.group_rounded, DataKelompok()),
                  menuButton(context, "Kalkulator", Icons.calculate_rounded, KalkulatorPage()),
                  menuButton(context, "Bilangan", Icons.numbers_rounded, BilanganPage()),
                  menuButton(context, "Total Angka", Icons.summarize_rounded, TotalAngka()),
                  menuButton(context, "Stopwatch", Icons.timer_rounded, StopwatchPage()),
                  menuButton(context, "Piramid", Icons.change_history_rounded, PiramidPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi menuButton yang sudah dipercantik tampilannya
  Widget menuButton(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: cutePink.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: softPink,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: deepPink),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog Logout agar aplikasi lebih fungsional
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Logout? 🥺"),
        content: Text("Yakin mau keluar dari aplikasi imut ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: deepPink),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (context) => LoginPage()), 
                (route) => false
              );
            },
            child: Text("Ya, Keluar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}