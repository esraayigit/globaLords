import 'package:flutter/material.dart';
import 'dart:async';

class banknot extends StatefulWidget {
  const banknot({super.key});

  @override
  State<banknot> createState() => _BanknotState();
}

class _BanknotState extends State<banknot> {
  int remainingTime = 240; // 4 dakika (240 saniye)
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _timer.cancel();
        showTimeUpScreen();
      }
    });
  }

  void showTimeUpScreen() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Süreniz Doldu!"),
        content: Text("Süreniz sona erdi, tekrar denemek ister misiniz?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("Ana Sayfa"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                remainingTime = 240;
                startTimer();
              });
            },
            child: Text("Tekrar Dene"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Banknotlar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          quizCard("assets/images/banknotlar/abdollar.jpeg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/euro.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/arab.png", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/russia.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/canada.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/argentina.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/china.png", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/japan.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/newzealand.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/norway.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/southkorea.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/vietnam.jpg", "Bu banknot hangi ülkeye ait?"),
          quizCard("assets/images/banknotlar/australia.jpg", "Bu banknot hangi ülkeye ait?"),
        ],
      ),
    );
  }

  Widget quizCard(String imagePath, String question) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imagePath, height: 150, width: 200, fit: BoxFit.cover),
            SizedBox(height: 200),
            Text(question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Cevabı Seç"))
          ],
        ),
      ),
    );
  }
}
