import 'package:flutter/material.dart';
import 'dart:async';

class Bayraklar extends StatefulWidget {
  const Bayraklar({super.key});

  @override
  State<Bayraklar> createState() => _BayraklarState();
}

class _BayraklarState extends State<Bayraklar> {
  int remainingTime = 240;
  late Timer _timer;
  Map<String, String> Bayraklar = {
    "assets/images/bayraklar/almanya.png": "Almanya",
    "assets/images/bayraklar/arjantin.png": "Arjantin",
    "assets/images/bayraklar/avustralya.png": "Avustralya",
    "assets/images/bayraklar/endonezya.png": "Endonezya",
    "assets/images/bayraklar/finlandiya.png": "Finlandiya",
    "assets/images/bayraklar/hindistan.png": "Hindistan",
    "assets/images/bayraklar/italya.png": "İtalya",
    "assets/images/bayraklar/meksika.png": "Meksika",
    "assets/images/bayraklar/polonya.png": "Polonya",
    "assets/images/bayraklar/portekiz.png": "Portekiz",
    "assets/images/bayraklar/turkiye.png": "Türkiye",
    "assets/images/bayraklar/yenizelanda.png": "Yeni Zelanda",
    "assets/images/bayraklar/yunanistan.png": "Yunanistan",
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
            "Bayraklar",
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
                  children: Bayraklar.keys.map((imagePath) => draggableCard(imagePath)).toList(),
                ),
                Column(
                  children: Bayraklar.values.map((country) => dragTargetBox(country)).toList(),
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
      data: Bayraklar[imagePath],
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
          Bayraklar.removeWhere((key, value) => value == country);
        });
      },
    );
  }
}
