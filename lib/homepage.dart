import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anasayfa")),
      body: Center(
        child: Text("Hoş Geldiniz!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
