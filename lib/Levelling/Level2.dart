import 'package:flutter/material.dart';

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Level 2'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Image(
              image: AssetImage('assets/foto/level2.png'),
              width: 300.0, // lebar gambar
              height: 300.0, // tinggi gambar
            ),
                Text(
                    "Selamat datang di Level 2, Fitur ini memungkinkan pengguna untuk berkomunikasi secara langsung dengan konselor. Pengguna dapat bercurhat dan mendapatkan dukungan melalui fitur ini."),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
