import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  final Widget homePage; // Parametre ekledik

  CountdownScreen({required this.homePage}); // Constructor güncellendi

  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _countdown = 3; // 3-2-1 geri sayım

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
        _startCountdown();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.homePage), //
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          '$_countdown',
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
