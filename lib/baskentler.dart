import 'package:flutter/material.dart';
import 'dart:async';

class baskentler extends StatefulWidget {
  const baskentler({super.key});

  @override
  State<baskentler> createState() => _BaskentlerState();
}

class _BaskentlerState extends State<baskentler> {
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
        title: Text("Baskentler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
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
          quizCard("assets/images/baskentler/tokyo.jpg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/berlin.jpg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/moscow.jpeg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/bosna.jpeg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/kiev.jpeg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/sofya.jpeg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/belgrad.jpeg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/kopenhag.jpg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/bern.jpg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/canberra.jpg", "Bu bayrak hangi ülkeye ait?"),
          quizCard("assets/images/baskentler/wellington.jpg", "Bu bayrak hangi ülkeye ait?"),
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
