import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ResimSaglayici.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ResimSaglayici>(context, listen: false).fetchLogoFromAPI());
  }

  @override
  Widget build(BuildContext context) {
    final resimSaglayici = Provider.of<ResimSaglayici>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 260,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF22DBE9)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  resimSaglayici.yukleniyor
                      ? CircularProgressIndicator()
                      : resimSaglayici.imageURL != null
                      ? Image.network(resimSaglayici.imageURL!)
                      : Text("Henüz resim yüklenemedi"),
                  SizedBox(height: 10),
                  Text(
                    'GlobaLords',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      fontFamily: 'Rowdies',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Bayraklar'),
            onTap: () {
              Navigator.pushNamed(context, '/bayraklar');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Başkentler'),
            onTap: () {
              Navigator.pushNamed(context, '/baskentler');
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Diller'),
            onTap: () {
              Navigator.pushNamed(context, '/diller');
            },
          ),
        ],
      ),
    );
  }
}
