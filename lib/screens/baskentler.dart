import 'package:flutter/material.dart';
import 'dart:async';

class baskentler extends StatefulWidget {
  const baskentler({super.key});

  @override
  State<baskentler> createState() => _BaskentlerState();
}

class _BaskentlerState extends State<baskentler> {
  int remainingTime = 240;
  late Timer _timer;
  Map<String, String> baskentler = {
    "assets/images/baskentler/tokyo.jpg": "Japonya",
    "assets/images/baskentler/berlin.jpg": "Almanya",
    "assets/images/baskentler/moscow.jpeg": "Rusya",
    "assets/images/baskentler/bosna.jpeg": "Bosna Hersek",
    "assets/images/baskentler/kiev.jpeg": "Ukrayna",
    "assets/images/baskentler/sofya.jpeg": "Bulgaristan",
    "assets/images/baskentler/belgrad.jpeg": "Sırbistan",
    "assets/images/baskentler/kopenhag.jpg": "Danimarka",
    "assets/images/baskentler/bern.jpg": "İsviçre",
    "assets/images/baskentler/canberra.jpg": "Avustralya",
    "assets/images/baskentler/wellington.jpg": "Yeni Zelanda",
  };

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
        title: Text(
            "Baskentler",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')
        ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: baskentler.keys.map((imagePath) => draggableCard(imagePath)).toList(),
                ),
                Column(
                  children: baskentler.values.map((country) => dragTargetBox(country)).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget draggableCard(String imagePath) {
    return Draggable<String>(
      data: baskentler[imagePath],
      feedback: Material(
        child: Image.asset(imagePath, height: 100, width: 150, fit: BoxFit.cover),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Image.asset(imagePath, height: 100, width: 150, fit: BoxFit.cover),
      ),
      child: Image.asset(imagePath, height: 100, width: 150, fit: BoxFit.cover),
    );
  }

  Widget dragTargetBox(String country) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            country,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
      },
      onWillAccept: (data) => data == country,
      onAccept: (data) {
        setState(() {
          baskentler.removeWhere((key, value) => value == country);
        });
      },
    );
  }
}
