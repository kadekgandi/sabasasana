import 'package:flutter/material.dart';
import 'package:bali_app/Display/NamaTempat.dart';
import 'package:bali_app/dto/Place.dart';

  Widget buildItem(Place data, context) {
    return GestureDetector(
      key: Key(data.nama), // Menggunakan text sebagai kunci
      onTap: () {
        // Aksi saat item diklik
       print(data.kategori);
      
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NamaTempat(data: data)));
      },

      child: Container(
        width: 100.0, // Lebar item
        height: 100.0, // Tinggi item
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black), // Garis kotak
          borderRadius: BorderRadius.circular(10.0), // Sudut kotak
        ),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              color: Colors.grey[300], // Warna placeholder
              child: Image.network(
                  data.url, // Ganti URL dengan URL gambar yang sesuai
                  width: 70.0, // Atur lebar gambar sesuai kebutuhan
                  height: 70.0, // Atur tinggi gambar sesuai kebutuhan
                ), // Ikon gambar placeholder
            ),
            SizedBox(height: 10.0),
           Flexible(
              child: Text(
                data.nama,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0),
              ),
           )
          ],
        ),
        
      ),
      
    );
  }
