import 'package:flutter/material.dart';

class DataKelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Kelompok")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Nama : Melania Intan Sagita"),
            Text("NIM : 123230005"),
            SizedBox(height: 10),
            Text("Nama : Fadilah Nur Sabiyyah"),
            Text("NIM : 123230006"),
            SizedBox(height: 10),
            Text("Nama : Miftah Sari Nurjana"),
            Text("NIM : 123230022"),
            SizedBox(height: 10),
            Text("Nama : Salsabila Rizky Setyabudi"),
            Text("NIM : 123230210"),
          ],
        ),
      ),
    );
  }
}
