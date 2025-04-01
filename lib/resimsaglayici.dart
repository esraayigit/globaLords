import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ResimSaglayici extends ChangeNotifier {

  String? imageURL;
  bool yukleniyor = false;


  Future<void> fetchLogoFromAPI() async {
    yukleniyor = true;
    notifyListeners();
    try {
      final uri = Uri.parse('https://picsum.photos/100/100');
      print("Logo API isteği yapılıyor: $uri");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        imageURL = uri.toString();
        print("Logo URL: $imageURL");
      } else {
        throw Exception('Logo yüklenemedi');
      }
    } catch (e) {
      print("Hata: $e");
      imageURL = null;
    } finally {
      yukleniyor = false;
      notifyListeners();
    }
  }


}