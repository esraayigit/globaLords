import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22DBE9),
      appBar: AppBar(
        title: Text(
          "GlobaLords",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 40,
              fontFamily: 'Rowdies'
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF22DBE9),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Konu.png',
              width: 300,
              height: 300,
            ),
            Text(
              "Globalords'a Hoş Geldiniz!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Rowdies'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "Bu eğlenceli macerada ülkelerin bayrakları, para birimleri ve başkentleri için hazırladığımız mini oyunlara hazır mısın? O zaman başlayalım...",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Rowdies'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                hintText: 'Kullanıcı adınızı girin',
                filled: true,
                fillColor: Color(0xFF22DBE9).withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                hintText: 'Şifrenizi girin',
                filled: true,
                fillColor: Color(0xFF22DBE2).withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                if (username.isNotEmpty && password.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lütfen kullanıcı adı ve şifre girin')),
                  );
                }
              },
              child: Text("Giriş yap", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Rowdies')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
