import 'package:flutter/material.dart';


class AnaLimanProvider with ChangeNotifier{


  List<String> seciliLimanlar =   [];


  void toggleStringInList( String str) {
    if (seciliLimanlar.contains(str)) {
      seciliLimanlar.remove(str); // Eğer liste içinde varsa, listeden kaldır
    } else {
      seciliLimanlar.add(str); // Eğer liste içinde yoksa, listeye ekle
    }
    notifyListeners();
  }




}
