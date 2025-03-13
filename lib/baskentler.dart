import 'package:flutter/material.dart';

class baskentler extends StatefulWidget {
  const baskentler({super.key});

  @override
  State<baskentler> createState() => _baskentlerState();
}

class _baskentlerState extends State<baskentler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22DBE9),
        title: Text("Başkentler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
