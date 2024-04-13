import 'package:flutter/material.dart';

import 'package:bali_app/Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Landing Page',
    home: LandingPage(),
  ));
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/foto/homepage.jpeg'),
              width: 300.0, // lebar gambar
              height: 300.0, // tinggi gambar
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // warna garis kotak
                  width: 2.0, // lebar garis kotak
                ),
                borderRadius: BorderRadius.circular(8.0), // sudut kotak
              ),
              padding: const EdgeInsets.all(10.0), // jarak dari tepi kotak
              child: const Text(
                "Aplikasi wisata untuk Bali yang fokus pada pantai, danau, dan gunung dapat menjadi panduan yang sangat berguna bagi wisatawan yang ingin menjelajahi keindahan alam pulau ini. Aplikasi ini menyediakan informasi lengkap tentang tempat-tempat wisata tersebut, termasuk deskripsi, lokasi, fasilitas yang tersedia, aktivitas yang dapat dilakukan, serta ulasan dari pengunjung sebelumnya. Pengguna juga dapat menemukan informasi tentang jalur pendakian, keindahan alam sekitar, dan tips-tips untuk menikmati pengalaman wisata yang optimal. Dengan aplikasi ini, wisatawan dapat merencanakan perjalanan mereka dengan lebih baik dan mengoptimalkan waktu yang mereka miliki di Bali.",
                textAlign: TextAlign.center, // teks berada di tengah
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
