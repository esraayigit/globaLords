import 'package:flutter/material.dart';
import 'dart:async';

class Bayraklar extends StatefulWidget {
  const Bayraklar({super.key});

  @override
  State<Bayraklar> createState() => _BayraklarState();
}

class _BayraklarState extends State<Bayraklar> {
  int remainingTime = 240; // 4 dakika (240 saniye)
  late Timer _timer;
  int score = 0;
  int currentQuestionIndex = 0;
  bool hintUsed = false;
  TextEditingController answerController = TextEditingController();

  final List<Map<String, dynamic>> questions = [
    {"image": "assets/images/bayraklar/turkiye.png", "answer": "Türkiye", "hint": "Kurucusu Ulu Önder Gazi Mustafa Kemal Atatürk'tür."},
    {"image": "assets/images/bayraklar/almanya.png", "answer": "Almanya", "hint": "Başkenti Berlin'dir."},
    {"image": "assets/images/bayraklar/italya.png", "answer": "İtalya", "hint": "Ünlü pizzalarıyla tanınır."},
    {"image": "assets/images/bayraklar/portekiz.png", "answer": "Portekiz", "hint": "Cristiano Ronaldo'nun ülkesidir."},
    {"image": "assets/images/bayraklar/arjantin.png", "answer": "Arjantin", "hint": "Messi'nin doğduğu ülkedir."},
  ];

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
        content: Text("Toplam Puanınız: $score\nTekrar denemek ister misiniz?"),
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
              restartGame();
            },
            child: Text("Tekrar Dene"),
          ),
        ],
      ),
    );
  }

  void restartGame() {
    setState(() {
      remainingTime = 240;
      score = 0;
      currentQuestionIndex = 0;
      hintUsed = false;
      answerController.clear();
      startTimer();
    });
  }

  void checkAnswer() {
    String userAnswer = answerController.text.trim().toLowerCase();
    String correctAnswer = questions[currentQuestionIndex]["answer"].toString().toLowerCase();

    if (userAnswer == correctAnswer) {
      setState(() {
        score += 20;
      });
    }

    moveToNextQuestion();
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        hintUsed = false;
        answerController.clear();
      });
    } else {
      _timer.cancel();
      showGameOverScreen();
    }
  }

  void showGameOverScreen() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Oyun Bitti!"),
        content: Text("Toplam Puanınız: $score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              restartGame();
            },
            child: Text("Tekrar Oyna"),
          ),
        ],
      ),
    );
  }

  void useHint() {
    if (!hintUsed) {
      setState(() {
        score -= 10;
        hintUsed = true;
      });
    }
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
        title: Text("Bayraklar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')} Puan: $score",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(questions[currentQuestionIndex]["image"], height: 150, width: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text("Bu bayrak hangi ülkeye ait?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                hintText: "Ülke adını yazın",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.white, // Beyaz renk
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAnswer, child: Text("Cevabı Gönder")),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: useHint,
              child: Text("İpucu Al (-10 Puan)"),
            ),
            if (hintUsed) Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                questions[currentQuestionIndex]["hint"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
