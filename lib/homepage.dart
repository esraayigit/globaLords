import 'package:flutter/material.dart';
import 'package:globalords/banknot.dart';
import 'package:globalords/baskentler.dart';
import 'package:globalords/diller.dart';
import 'bayraklar.dart';
import 'CountDownScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Anasayfa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            quizButton(context, 'assets/images/bayrakquiz.png', "Bayrakların hangi ülkeye ait olduğunu bul!", Bayraklar()),
            SizedBox(height: 15),
            quizButton(context, 'assets/images/baskent.jpg', "Başkentleri tahmin et!", baskentler()),
            SizedBox(height: 15),
            quizButton(context, 'assets/images/banknotes.jpeg', "Banknotları tahmin et!", banknot()),
            SizedBox(height: 15),
            quizButton(context, 'assets/images/languages.jpg', "Bu hangi dil?", diller()),
          ],
        ),
      ),
    );
  }

  Widget quizButton(BuildContext context, String imagePath, String title, Widget homePage) {
    return Container(
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(40),
        color: Colors.black.withOpacity(0.4),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountdownScreen(homePage: homePage)),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'Rowdies',
          ),
        ),
      ),
    );
  }
}
