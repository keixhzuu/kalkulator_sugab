import 'package:flutter/material.dart';

class DataKelompok extends StatelessWidget {
  const DataKelompok({super.key});

  static const Color cutePink = Color(0xFFFFB6C1);
  static const Color softPink = Color(0xFFFFE4E1);
  static const Color deepPink = Color(0xFFFF69B4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softPink,
      appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.white),
        title: Text("Anggota Kelompok ✨", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: cutePink,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Lucu
            Icon(Icons.stars_rounded, size: 50, color: deepPink),
            SizedBox(height: 10),
            Text(
              "Meet Our Team!",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Colors.brown[600]
              ),
            ),
            SizedBox(height: 20),
            
            _buildMemberCard("Melania Intan Sagita", "123230005"),
            _buildMemberCard("Fadilah Nur Sabiyyah", "123230006"),
            _buildMemberCard("Miftah Sari Nurjana", "123230022"),
            _buildMemberCard("Salsabila Rizky Setyabudi", "123230210"),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard(String nama, String nim) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: cutePink.withValues(alpha:0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: softPink,
            child: Icon(Icons.face_retouching_natural_rounded, color: deepPink),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.brown[700]
                ),
              ),
              Text(
                "NIM: $nim",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}