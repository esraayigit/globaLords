import 'package:flutter/material.dart';

class diller extends StatefulWidget {
  const diller({super.key});

  @override
  State<diller> createState() => _dillerState();
}

class _dillerState extends State<diller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Diller", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
