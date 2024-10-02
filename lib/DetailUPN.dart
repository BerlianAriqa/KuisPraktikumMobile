import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail UPNVY'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar gedung
            Center(
              child: Image.asset(
                'assets/upn.png', 
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Teks mengenai UPN
            Text(
              'Universitas Pembangunan Nasional "Veteran" Yogyakarta (UPNVY) '
              'merupakan salah satu perguruan tinggi di Indonesia yang dikenal '
              'dengan program-program akademiknya yang berfokus pada pengembangan '
              'ilmu pengetahuan dan teknologi. UPNVY berkomitmen untuk menciptakan '
              'mahasiswa yang kompeten, kreatif, dan memiliki integritas tinggi.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}