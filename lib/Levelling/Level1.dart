import 'package:flutter/material.dart';

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Level 1',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: AssetImage('assets/foto/level1.png'),
              width: 300.0, // lebar gambar
              height: 300.0, // tinggi gambar
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Selamat datang di Level 1",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Fitur ini memungkinkan pengguna untuk berkomunikasi secara langsung dengan konselor. Pengguna dapat bercurhat dan mendapatkan dukungan melalui fitur ini.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.blueAccent,
              thickness: 2.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildOptionBox("Apakah benar sulit tidur"),
            SizedBox(
              height: 10.0,
            ),
            _buildOptionBox("Sering bergadang"),
            SizedBox(
              height: 10.0,
            ),
            _buildOptionBox("Sulit tidur"),
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: AssetImage('assets/foto/fotogandi.png'),
              width: 200.0, // lebar gambar
              height: 200.0, // tinggi gambar
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionBox(String text) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Icon(
            Icons.check_circle,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
