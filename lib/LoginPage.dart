import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Inisiasi state
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  // Function redirect
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Menambahkan dua gambar di dalam Card dengan teks di antaranya
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BELA NEGARA",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0), // Memberi jarak atas pada gambar 
                          child: Image.asset(
                            'Assets/logo_upn.png', // Ganti dengan nama gambar kedua
                            height: 200, // Tinggi gambar kedua
                            width: 200, // Lebar gambar kedua
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0), // Jarak antara gambar dan field username
                      child: _usernameField(),
                    ),
                    SizedBox(height: 10),
                    _passwordField(),
                  ],
                ),
              ),
            ),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        username = value;
      },
      style: TextStyle(color: Colors.green),
      decoration: InputDecoration(
        hintText: 'Masukkan username',
        hintStyle: TextStyle(color: Colors.green),
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      obscureText: visible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            color: Colors.green,
          ),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
        ),
        
        hintText: 'Masukkan password',
        hintStyle: TextStyle(color: Colors.green),
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'Hanna' && password == 'upnoke') {
            _navigateToHome();

            setState(() {
              text = "Login berhasil";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = "Login gagal";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.blue : Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Masuk'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
