import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/AnaLimanProvider.dart';
import 'package:untitled/providers/EkstraUcretLiamnlarProvider.dart';
import 'package:untitled/providers/SeciliWidgetProvider.dart';
import 'package:untitled/providers/SehirProvider.dart';
import 'package:untitled/views/AciklamalarPage.dart';
import 'package:untitled/views/OrganizasyonlarPage.dart';
import 'package:untitled/views/SartlarPage.dart';
import 'package:untitled/views/TasitlarDetayPage.dart';
import 'package:untitled/views/GenelIstatistiklerPage.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SehirProvider(),),
    ChangeNotifierProvider(create: (context) => SeciliWidgetProvider(),),
    ChangeNotifierProvider(create: (context) => AnaLimanProvider(),),
    ChangeNotifierProvider(create: (context) => EkstraUcretLimanlarProvider(),),

  ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.interTightTextTheme(),
        ),
        home: SafeArea(child: GenelIstatistiklerPage(),)
    );
  }
}