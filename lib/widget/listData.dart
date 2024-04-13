import 'package:flutter/material.dart';
import 'package:sabasasana/widget/buildItem.dart';
import 'package:sabasasana/dto/Place.dart';

Widget buildListView(BuildContext context, Future<List<Place>> places, String kategori) {

  return  Container(
        height: 200.0,
        padding: EdgeInsets.only(top: 20.0, right: 20.0, bottom: 10.0, left: 20.0),
        child:FutureBuilder<List<Place>>(
        future: places,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final dataList = snapshot.data!;
            // buildListView(contect, dataList)
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final data = dataList[index];
                if (data.kategori.toLowerCase() == kategori) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(width: 10),
                      buildItem(data, context),
                      SizedBox(width: 10),
                      ],
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          }
        },
     ),
       );
}



