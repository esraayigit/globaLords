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
  bool isAnswerCorrect = false;
  bool isAnswered = false;

  final List<Map<String, dynamic>> questions = [
    {"image": "assets/images/baskentler/berlin.jpg","baskent": "Berlin", "answer": "Almanya", "hint": "Bu ülke ünlü otobüs markası Volkswagen'e sahiptir."},
    {"image": "assets/images/baskentler/tokyo.jpg","baskent": "Tokyo", "answer": "Japonya", "hint": "Bu ülke, geleneksel çay seremonisi ve samuray kültürüyle tanınır."},
    {"image": "assets/images/baskentler/belgrad.jpeg","baskent": "Belgrad", "answer": "Sirbistan", "hint": "Bu ülke, tarihi Yugoslavya'nın bir parçasıydı ve Balkanlar'da yer alır."},
    {"image": "assets/images/baskentler/bern.jpg","baskent": "Bern", "answer": "İsvicre", "hint": "Bu ülke, çikolata ve saat üretimiyle ünlüdür."},
    {"image": "assets/images/baskentler/moscow.jpeg","baskent": "Moskova", "answer": "Rusya", "hint": "Bu ülke, dünyanın en büyük kara sınırına sahip olup, ünlü Matruşka bebekleriyle tanınır."},
    {"image": "assets/images/baskentler/canberra.jpg","baskent": "Canberra", "answer": "Avustralya", "hint": "Bu ülke, kangurular, koalalar ve Büyük Set Resifi ile ünlüdür."},
    {"image": "assets/images/baskentler/kiev.jpeg","baskent": "Kiev", "answer": "Ukrayna", "hint": "Bu ülke, dünyanın en büyük tahıl üreticilerinden biridir."},
    {"image": "assets/images/baskentler/kopenhag.jpg","baskent": "Kopenhag", "answer": "Danimarka", "hint": "Bu ülke, mutlu insanlar ve Lego'nun doğum yeri olarak bilinir."},
    {"image": "assets/images/baskentler/sofya.jpeg","baskent": "Sofya", "answer": "Bulgaristan", "hint": "Bu ülke, geleneksel yoğurt üretimi ve eski Roma kalıntılarıyla tanınır."},
    {"image": "assets/images/baskentler/wellington.jpg","baskent": "Wellington", "answer": "Yeni Zelanda", "hint": "Bu ülke, Hobbit ve Yüzüklerin Efendisi film serilerinin çekildiği yerdir."},
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
              Navigator.pushNamed(context, '/homepage');
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

    setState(() {
      if (userAnswer == correctAnswer) {
        score += 20;
        isAnswerCorrect = true;
      } else {
        isAnswerCorrect = false;
      }
      isAnswered = true;
    });
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        isAnswered = false;
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
            child: Text("Tekrar Dene"),
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
              child: SizedBox(
                height: 350,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: isAnswered
                          ? Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isAnswerCorrect ? Icons.check_circle : Icons.cancel,
                              color: isAnswerCorrect ? Colors.green : Colors.red,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              isAnswerCorrect ? 'Doğru Cevap' : 'Yanlış Cevap',
                              style: TextStyle(
                                color: isAnswerCorrect ? Colors.green : Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                          : null,
                    ),
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
                        questions[currentQuestionIndex]["baskent"],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
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
            ElevatedButton(
              onPressed: isAnswered
                  ? () {
                moveToNextQuestion();
              }
                  : null,
              child: Text("Diğer Soruyu Geç"),
            ),
          ],
        ),
      ),
    );
  }
}
