import 'package:flutter/material.dart';
import 'package:bali_app/dto/Place.dart';
import 'package:bali_app/widget/listData.dart';

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
          // Gunung
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: [
                  buildListView(context, places, 'gunung'),
                  Positioned(
                    left: 150,
                    right: 150,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: const Text(
                        'GUNUNG',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 2,
          ),
          // end gunung
          // danau
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: [
                  buildListView(context, places, 'danau'),
                  Positioned(
                    left: 150,
                    right: 150,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: const Text(
                        'DANAU',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // end danau
          // pantai
          SizedBox(
            height: 2,
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: [
                  buildListView(context, places, 'pantai'),
                  Positioned(
                    left: 150,
                    right: 150,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: const Text(
                        'PANTAI',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // end pantai
        ],
      ),
    );
  }
}
