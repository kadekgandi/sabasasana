import 'package:flutter/material.dart';
import 'package:bali_app/dto/Place.dart';
import 'package:bali_app/services/place.dart';
import 'package:bali_app/Home.dart';

// ignore: must_be_immutable
class NamaTempat extends StatefulWidget {
  Place data;
  @override  

  NamaTempat({required this.data});

  _NamaTempat createState() => _NamaTempat();
}

class _NamaTempat extends State<NamaTempat>{

  @override
  void initState() {
    super.initState();
  }

  void changeState(Place newData) {
  setState(() {
    widget.data = newData;
  });
}

  //fungsi delete
  void _deleteData(BuildContext context) {
    // Panggil fungsi delete data di sini
    DatabaseHelper.deleteData(widget.data.id!); // Gantilah id dengan id data yang ingin dihapus
    // Navigator.of(context).pop(); // Tutup dialog
     Navigator.of(context).pop();
  }
   Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this data?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteData(context);
           Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              },
            ),
          ],
        );
      },
    );
  }

  // edit
   Future<void> _showEditDialog(BuildContext context) async {
    // Dapatkan data yang ingin diedit
    Place placeData = widget.data;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        String nama = placeData.nama;
        String kategori = placeData.kategori;
        String body = placeData.body;
        String url = placeData.url;

        return AlertDialog(
          title: Text('Edit Data'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // mengambil data yang dimasukan oleh pengguna
                TextFormField(
                  initialValue: nama,
                  onChanged: (value) {
                    nama = value;
                  },
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  initialValue: kategori,
                  onChanged: (value) {
                    kategori = value;
                  },
                  decoration: InputDecoration(labelText: 'Category'),
                ),
                TextFormField(
                  initialValue: body,
                  onChanged: (value) {
                    body = value;
                  },
                  decoration: InputDecoration(labelText: 'Body'),
                ),
                TextFormField(
                  initialValue: url,
                  onChanged: (value) {
                    url = value;
                  },
                  decoration: InputDecoration(labelText: 'URL'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Panggil fungsi updateData untuk memperbarui data di database
                Place updatedPlace = Place(
                  id: placeData.id,
                  nama: nama,
                  kategori: kategori,
                  body: body,
                  url: url,
                );
                DatabaseHelper.updateData(updatedPlace);
      
                // Navigator.of(context).pop(); // Close the dialog
                   Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              },
            ),
          ],
        );
      },
    );
     
   }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data.nama),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 'edit',
                ),
                PopupMenuItem(
                  child: Text('Hapus'),
                  value: 'hapus',
                ),
              ],
             onSelected: (value) {
        
              // Aksi ketika item dipilih
              if (value == 'edit'){
             
                _showEditDialog(context);  
               
              } else {
                _showDeleteConfirmationDialog(context);
              }
          
            }
            
            ),
          ],
        ),
        body: SingleChildScrollView(
        
        padding: EdgeInsets.all(20.0),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Text(widget.data.body),
              Divider(),
            
             
            ],
          ),
        ),
        )
      );
  }
}