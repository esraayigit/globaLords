import 'package:flutter/material.dart';
import 'homepage.dart';

class BaslangicSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22DBE9),
      appBar: AppBar(
        title: Text("GlobaLords",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 40,fontFamily: 'Rowdies')),
        centerTitle: true,
        backgroundColor: Color(0xFF22DBE9),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
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
                fontFamily: 'Rowdies'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "Bu oyunda bayraklar, banknotlar, başkentler ve özel ipuçlarıyla ülkeleri tahmin etmeye çalışacaksınız. Quizin sonunda puan alacaksınız "
                  "4-5 farklı quiz modu ile eğlenceli ve öğretici bir deneyim sizi bekliyor!",
              style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Rowdies'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Başlamak İçin Tıklayınız", style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: 'Rowdies')),
            ),
          ],
        ),
      ),
    );
  }
}
