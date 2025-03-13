import 'package:flutter/material.dart';

class banknot extends StatefulWidget {
  const banknot({super.key});

  @override
  State<banknot> createState() => _banknotState();
}

class _banknotState extends State<banknot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Banknotlar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
