import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Bela Negara',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(username: "User"), // untuk menyesuaikan dengan nama pengguna
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  final List<Faculty> faculties = [
    Faculty(
      name: 'Fakultas Teknik',
      numberOfMajors: 5,
      numberOfStudents: 200,
      imageAsset: 'assets/teknik.png', 
      imageUrls: ['url1', 'url2'],
    ),
    Faculty(
      name: 'Fakultas Ekonomi',
      numberOfMajors: 4,
      numberOfStudents: 150,
      imageAsset: 'assets/ekonomi.png',
      imageUrls: ['url1', 'url2'],
    ),
    Faculty(
      name: 'Fakultas Hukum',
      numberOfMajors: 3,
      numberOfStudents: 100,
      imageAsset: 'assets/hukum.png', 
      imageUrls: ['url1', 'url2'],
    ),
    Faculty(
      name: 'Fakultas Ilmu Sosial dan Ilmu Politik',
      numberOfMajors: 6,
      numberOfStudents: 250,
      imageAsset: 'assets/sosial.png', 
      imageUrls: ['url1', 'url2'],
    ),
    Faculty(
      name: 'Fakultas Pertanian',
      numberOfMajors: 2,
      numberOfStudents: 80,
      imageAsset: 'assets/pertanian.png', 
      imageUrls: ['url1', 'url2'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "Halo, $username",
          style: TextStyle(fontSize: 24),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card menuju halaman tentang UPN Jogja
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailUPN(),
                  ),
                );
              },
              child: Card(
                color: Colors.lightGreen[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sudahkah kamu mengenal UPN Jogja?",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "UPN Jogja adalah kampus favorit di DIY lho!",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Kenalan lebih jauh yuk!",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "LIST FAKULTAS UPN Jogja",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: faculties.length,
                itemBuilder: (context, index) {
                  final faculty = faculties[index];
                  return FacultyCard(faculty: faculty);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Faculty {
  String name;
  int numberOfMajors;
  int numberOfStudents;
  String imageAsset;
  List<String> imageUrls;

  Faculty({
    required this.name,
    required this.numberOfMajors,
    required this.numberOfStudents,
    required this.imageAsset,
    required this.imageUrls,
  });
}

class DetailUPN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "Detail UPNVY",
          style: TextStyle(fontSize: 24),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
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
                'assets/upn.jpg', // Ganti dengan path yang sesuai untuk gambar lokal
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Teks mengenai UPN
            // Arah Pendidikan
            Text(
              'Arah Pendidikan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Arah pendidikan UPN ”Veteran” Yogyakarta adalah mengembangkan ilmu '
              'pengetahuan dan teknologi yang dilandasi oleh nilai-nilai kedisiplinan, '
              'kejuangan, kreativitas, keunggulan, kebangsaan, dan kejujuran dalam '
              'rangka menunjang pembangunan nasional melalui bidang pendidikan tinggi '
              'dalam rangka terciptanya sumber daya manusia yang unggul di era global '
              'dengan dilandasi jiwa bela negara.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Tujuan Pendidikan
            Text(
              'Tujuan Pendidikan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Pendidikan di UPN ”Veteran” Yogyakarta bertujuan untuk:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '1. Menyelenggarakan pendidikan dan pengajaran yang berkualitas guna '
              'menghasilkan lulusan berdaya saing global yang memiliki jiwa disiplin, '
              'berdaya juang dan, kreatif serta berwawasan kebangsaan dan mampu '
              'menjadi komponen pendukung dalam sistem pertahanan negara;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Meningkatkan kuantitas dan kualitas penelitian guna:',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'a. Menunjang pengembangan mutu pendidikan dan pengajaran;',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'b. Mengembangkan dan menerapkan ilmu pengetahuan dan teknologi '
                    '(IPTEK) untuk menunjang pengabdian kepada masyarakat; dan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'c. Menghasilkan modal intelektual dan karya ilmiah dalam rangka '
                    'menunjang pembangunan nasional;',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '3. Pengembangan kegiatan pengabdian kepada masyarakat melalui:',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'a. Penyediaan layanan ilmu pengetahuan dan teknologi (IPTEK) '
                    'dalam rangka meningkatkan kesejahteraan masyarakat;',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'b. Peningkatan keberdayaan masyarakat; dan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'c. Peningkatan reputasi UPN ”Veteran” Yogyakarta.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacultyCard extends StatelessWidget {
  final Faculty faculty;

  FacultyCard({required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(faculty.name),
        subtitle: Text("Jurusan: ${faculty.numberOfMajors}, Mahasiswa: ${faculty.numberOfStudents}"),
      ),
    );
  }
}