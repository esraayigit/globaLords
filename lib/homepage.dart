import 'package:flutter/material.dart';
import 'package:globalords/banknot.dart';
import 'package:globalords/baskentler.dart';
import 'package:globalords/diller.dart';
import 'bayraklar.dart';

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
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bayrakquiz.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(0.4),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bayraklar()),
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
                      "Bayrakların hangi ülkeye ait olduğunu bul!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Rowdies',
                      ),
                    ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/baskent.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(0.4),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => baskentler()),
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
                  "Başkentleri tahmin et!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Rowdies',
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banknotes.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(0.4),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => banknot()),
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
                  "Banknotları tahmin et!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Rowdies',
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/languages.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.black.withOpacity(0.4),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => diller()),
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
                  "Bu hangi dil?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Rowdies',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}