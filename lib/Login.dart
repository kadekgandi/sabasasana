import 'package:flutter/material.dart';
import 'package:sabasasana/Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Pengecekan jika username dan password sesuai
    if (username == 'user' && password == 'user') {
      // Navigasi ke halaman baru
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      // Menampilkan pesan kesalahan
      setState(() {
        errorMessage = 'Username atau password salah';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   
        backgroundColor: Colors.blueAccent,
        title: const Text('Login'),
      ),
      backgroundColor: Colors.blue, // Warna latar belakang
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/foto/profile.png'),
              radius: 50.0,
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: errorMessage != '' ? errorMessage : null,
                border: const OutlineInputBorder(),
                
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: errorMessage != '' ? errorMessage : null,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
