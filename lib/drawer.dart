import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 130,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF22DBE9)),
              child: Center(
                child: Text(
                  'GlobaLords',
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28, fontFamily: 'Rowdies')
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/homepage'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Bayraklar'),
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/bayraklar'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Başkentler'),
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/baskentler'
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Diller'),
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/diller'
              );
            },
          ),
        ],
      ),
    );
  }
}
