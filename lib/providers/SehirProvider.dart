import 'package:flutter/cupertino.dart';

class SehirProvider extends ChangeNotifier {


  String sehir ="İstanbul";

  degistir(String sehirAdi){
    sehir=sehirAdi;
    notifyListeners();
  }

}