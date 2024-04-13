import 'package:flutter/material.dart';
import 'package:sabasasana/utility/Drawer.dart';
import 'package:sabasasana/dto/Place.dart';
import 'package:sabasasana/services/place.dart';
import 'package:sabasasana/Display/ProfilePage.dart';
import 'package:sabasasana/Display/fitur1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sabasasana',
      home: HomePage(),
      );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
 late Future<List<Place>> _places;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      _places = DatabaseHelper.getData();
    });
  }


  int _selectedIndex = 0;
  static List<Widget> _widgetOptions(BuildContext context, Future<List<Place>> places){
   return [ Wisata(places: places),
    // Text('Search Page'),
    ProfilePage(),
  ];
  }

  void _onItemTapped(int index) {
      if (index == 0) {
      _refreshData();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('SABASASANA'),
          backgroundColor: const Color.fromARGB(255, 244, 168, 3),
        ),
        
        drawer: DrawerWidget(),
        body: 
        IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions(context, _places),
        ),

      //  
       bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 252, 252, 252),
            backgroundColor: const Color.fromARGB(255, 244, 168, 3),
            onTap: _onItemTapped,
          ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addPlace2(context);
            },
            child: Icon(Icons.add),
          ),
      );
  }


void _addPlace2(BuildContext context) async {
  TextEditingController namaController = TextEditingController();
    TextEditingController kategoriController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    TextEditingController urlController = TextEditingController();

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Tambah Data'),
        content: SingleChildScrollView(
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
                TextField(
                  controller: namaController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: kategoriController,
                  decoration: InputDecoration(labelText: 'Kategori'),
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(labelText: 'Body'),
                ),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'URL'),
                ),
              ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
             // Tambahkan data ke database
                DatabaseHelper.insertData(Place(
                  nama: namaController.text,
                  kategori: kategoriController.text,
                  body: bodyController.text,
                  url: urlController.text,
                )).then((_) {
                  // Perbarui tampilan setelah menambahkan data
                  _refreshData();
                  Navigator.of(context).pop();
                });
              },
            child: Text('Simpan'),
          ),
        ],
      );
    },
  );
}

}


