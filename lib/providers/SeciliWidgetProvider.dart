
import 'package:flutter/material.dart';

class SeciliWidgetProvider with ChangeNotifier{

  String seciliWidget = "Lokasyon";

  changeSeciliWidget(String secilenWidget){
    seciliWidget=secilenWidget;
    notifyListeners();
  }

}