import 'package:flutter/material.dart';

class bayraklar extends StatefulWidget {
  const bayraklar({super.key});

  @override
  State<bayraklar> createState() => _bayraklarState();
}

class _bayraklarState extends State<bayraklar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Bayraklar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
