import 'package:flutter/material.dart';
import 'package:bali_app/main.dart';
import 'package:bali_app/Tugas1/NewsPage.dart';


class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/foto/cahya.jpg'), 
                ),
                SizedBox(height: 10),
                Text(
                  'Kadek Cahya Sugana', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Cahya 4C'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsPage()),);
            },
          ),
         
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Perform logout operations
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),);
            },
          ),
        ],
      ),
    );
  }
  }