import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Menggunakan desain Material 3 yang lebih modern
      ),
      home: LoginPage(), // Sekarang langsung ke Login
    );
  }
}