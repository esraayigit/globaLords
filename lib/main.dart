import 'package:flutter/material.dart';
import 'package:globalords/screens/banknot.dart';
import 'package:globalords/screens/baskentler.dart';
import 'package:globalords/screens/bayraklar.dart';
import 'package:globalords/screens/diller.dart';
import 'package:globalords/screens/homepage.dart';
import 'screens/loginpage.dart';
import 'ResimSaglayici.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ResimSaglayici(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login':(context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/bayraklar': (context) => Bayraklar(),
        '/baskentler': (context) => baskentler(),
        '/banknotlar': (context) => Banknot(),
        '/diller': (context) => Diller(),
      },
    );
  }
}
