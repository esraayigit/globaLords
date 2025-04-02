import 'package:flutter/material.dart';
import 'dart:async';

class Baskentler extends StatefulWidget {
  const Baskentler({super.key});

  @override
  State<Baskentler> createState() => _BaskentlerState();
}

class _BaskentlerState extends State<Baskentler> {
  int remainingTime = 240;
  late Timer _timer;
  int score = 0;
  int currentQuestionIndex = 0;
  bool hintUsed = false;
  TextEditingController answerController = TextEditingController();

  final List<Map<String, dynamic>> questions = [
    {"image": "assets/images/baskentler/berlin.jpg", "answer": "Almanya", "hint": "Bu ülke ünlü otobüs markası Volkswagen'e sahiptir."},
    {"image": "assets/images/baskentler/tokyo.jpg", "answer": "Japonya", "hint": "Bu ülke, geleneksel çay seremonisi ve samuray kültürüyle tanınır."},
    {"image": "assets/images/baskentler/belgrad.jpeg", "answer": "Sırbistan", "hint": "Bu ülke, tarihi Yugoslavya'nın bir parçasıydı ve Balkanlar'da yer alır."},
    {"image": "assets/images/baskentler/bern.jpg", "answer": "İsviçre", "hint": "Bu ülke, çikolata ve saat üretimiyle ünlüdür."},
    {"image": "assets/images/baskentler/moscow.jpeg", "answer": "Rusya", "hint": "Bu ülke, dünyanın en büyük kara sınırına sahip olup, ünlü Matruşka bebekleriyle tanınır."},
    {"image": "assets/images/baskentler/canberra.jpg", "answer": "Avustralya", "hint": "Bu ülke, kangurular, koalalar ve Büyük Set Resifi ile ünlüdür."},
    {"image": "assets/images/baskentler/kiev.jpeg", "answer": "Ukrayna", "hint": "Bu ülke, dünyanın en büyük tahıl üreticilerinden biridir."},
    {"image": "assets/images/baskentler/kopenhag.jpg", "answer": "Danimarka", "hint": "Bu ülke, mutlu insanlar ve Lego'nun doğum yeri olarak bilinir."},
    {"image": "assets/images/baskentler/sofya.jpeg", "answer": "Bulgaristan", "hint": "Bu ülke, geleneksel yoğurt üretimi ve eski Roma kalıntılarıyla tanınır."},
    {"image": "assets/images/baskentler/wellington.jpg", "answer": "Yeni Zelanda", "hint": "Bu ülke, Hobbit ve Yüzüklerin Efendisi film serilerinin çekildiği yerdir."},
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
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Ana Sayfa")),
          TextButton(onPressed: restartGame, child: Text("Tekrar Dene")),
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
          TextButton(onPressed: restartGame, child: Text("Tekrar Oyna")),
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
        title: Text("Başkentler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
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
      body: Container(
        color: Color(0xFF22DBE9),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              elevation: 4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.asset(
                      questions[currentQuestionIndex]["image"],
                      height: 250,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questions[currentQuestionIndex]["answer"],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                hintText: "Bu başkentin ülkesini yazın",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAnswer, child: Text("Cevapla")),
            ElevatedButton(onPressed: useHint, child: Text("İpucu al (-10 puan)")),
            if (hintUsed) Text(questions[currentQuestionIndex]["hint"], style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
