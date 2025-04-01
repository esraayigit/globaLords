import 'package:flutter/material.dart';
import 'dart:async';

class Diller extends StatefulWidget {
  const Diller({super.key});

  @override
  State<Diller> createState() => _DillerState();
}

class _DillerState extends State<Diller> {
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
        title: Text("Diller", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
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
          quizCard("Egal wie bewölkt der Himmel ist, irgendwo scheint die Sonne noch.", "Bu dil hangi ülkeye ait?"),     // almanca
          quizCard("Как бы ни было пасмурно, где-то ещё светит солнце.", "Bu dil hangi ülkeye ait?"), // rusca
          quizCard("Non importa quanto sia nuvoloso il cielo, da qualche parte il sole continua a splendere.", "Bu dil hangi ülkeye ait?"), // italyanca
          quizCard("No importa cuán nublado esté el cielo, en algún lugar el sol sigue brillando.", "Bu dil hangi ülkeye ait?"), // ispanyollca
          quizCard(" مهما كانت السماء ملبدة بالغيوم، فإن الشمس لا تزال تشرق في مكان ما", "Bu dil hangi ülkeye ait?"), // arapca
          quizCard("空がどんなに曇っていても、どこかで太陽は輝き続けている。", "Bu dil hangi ülkeye ait?"), // japon
          quizCard("하늘이 아무리 흐려도 태양은 어딘가에서 계속 빛나고 있다.", "Bu dil hangi ülkeye ait?"), // kore
          quizCard("无论天空多么阴云密布，太阳仍然在某个地方闪耀。", "Bu dil hangi ülkeye ait?"), // china-mandarin
          quizCard("ไม่ว่าท้องฟ้าจะมืดครึ้มแค่ไหน พระอาทิตย์ก็ยังคงส่องแสงอยู่ที่ใดที่หนึ่ง", "Bu dil hangi ülkeye ait?"), // tayca
          quizCard("Tidak peduli seberapa mendung langit, matahari masih bersinar di suatu tempat. ", "Bu dil hangi ülkeye ait?"), // endonezce
          quizCard("Kahit gaano kakulimlim ang langit, may araw pa ring sumisikat sa kung saan.", "Bu dil hangi ülkeye ait?"), // filipince-tagalog

        ],
      ),
    );
  }

  Widget quizCard(String ornekyazi, String question) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(ornekyazi, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 19, fontFamily: 'Rowdies'),),
            SizedBox(height: 100),
            Text(question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Cevabı Seç"))
          ],
        ),
      ),
    );
  }
}
