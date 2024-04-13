import 'package:flutter/material.dart';
import 'package:sabasasana/dto/Place.dart';
import 'package:sabasasana/widget/listData.dart';

class Wisata extends StatelessWidget {
  final Future<List<Place>> places;

  // Constructor
  Wisata({required this.places});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Spasi di atas teks

          // Level 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Level 1',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18, // Ukuran teks lebih besar
              ),
              textAlign: TextAlign.center, // Teks berada di tengah
            ),
          ),

          SizedBox(height: 10), // Spasi antara teks dan gambar
          
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Center( // Gambar di tengah-tengah
                  child: Container(
                    height: 120, // Ukuran persegi
                    width: 120, // Ukuran persegi
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage('assets/foto/level1.png'), // Gambar latar belakang
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                buildListView(context, places, 'Level 1'),
              ],
            ),
          ),

          SizedBox(height: 20), // Spasi antara gambar dan teks selanjutnya

          // Level 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Level 2',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18, // Ukuran teks lebih besar
              ),
              textAlign: TextAlign.center, // Teks berada di tengah
            ),
          ),

          SizedBox(height: 10), // Spasi antara teks dan gambar
          
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Center( // Gambar di tengah-tengah
                  child: Container(
                    height: 120, // Ukuran persegi
                    width: 120, // Ukuran persegi
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage('assets/foto/level2.png'), // Gambar latar belakang
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                buildListView(context, places, 'Level 2'),
              ],
            ),
          ),

          SizedBox(height: 20), // Spasi antara gambar dan teks selanjutnya

          // Level 3
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Level 3',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18, // Ukuran teks lebih besar
              ),
              textAlign: TextAlign.center, // Teks berada di tengah
            ),
          ),

          SizedBox(height: 10), // Spasi antara teks dan gambar
          
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Center( // Gambar di tengah-tengah
                  child: Container(
                    height: 120, // Ukuran persegi
                    width: 120, // Ukuran persegi
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage('assets/foto/level3.png'), // Gambar latar belakang
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                buildListView(context, places, 'Level 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
