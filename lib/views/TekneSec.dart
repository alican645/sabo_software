import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization/TrasnlateService.dart'; // Buraya kendi çeviri servisinizin yolunu ekleyin.

class TekneSecPage extends StatefulWidget {
  TekneSecPage({super.key});

  @override
  State<TekneSecPage> createState() => _TekneSecPageState();
}

class _TekneSecPageState extends State<TekneSecPage> {
  List<String> textListTranslated = [];
  List<String> textListOriginal = ["Taşıtlarım", "Tekne Seç", "Tekne Adı","Doğrulanmış Tekne","Yorumları Görüntüle",];
  String targetLanguage = "tr"; // İngilizceye çevir

  @override
  void initState() {
    super.initState();
    _loadItems();
      if(!textListTranslated.isEmpty){
        print("object");
        getTexts();
    }



  }

  @override
  void dispose(){
    super.dispose();

  }

  //SharedPreferences'a listeyi kaydetmek
  Future<void> _saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(textListTranslated);
    await prefs.setString('items', jsonString);
  }

  // SharedPreferences'tan listeyi yüklemek için
  Future<void> _loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsString = prefs.getString('items');
    if (itemsString != null) {
      List<dynamic> jsonList = jsonDecode(itemsString);
      setState(() {
        textListTranslated = List<String>.from(jsonList);
      });
    }

  }


  void getTexts() async {
    final GoogleTranslateServiceWithTextList _translateService = GoogleTranslateServiceWithTextList();

    List<String?> translatedTexts = await _translateService.translateTextList(textListOriginal, targetLanguage);

    setState(() {
      textListTranslated = translatedTexts.whereType<String>().toList(); // Çevirilen metinleri listeye ekleyin
    });
    _saveItems();
  }

  final TextStyle _mainTitleTextStyle = GoogleFonts.interTight(
      fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xff1A2228));

  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF4F8FA),
      appBar: AppBar(
        title: textListTranslated.isNotEmpty ? Text(textListTranslated.isNotEmpty ? textListTranslated[0] : textListOriginal[0]):null,
        centerTitle: true,
      ),
      body: textListTranslated.isNotEmpty ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(textListTranslated.isNotEmpty ? textListTranslated[1] : "asd:${textListOriginal[1]}", style: _mainTitleTextStyle),
                  const SizedBox(height: 12),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/tekne.png",
                          fit: BoxFit.cover,
                          width: size.width * 0.9,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xffF9FCFD).withOpacity(1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(textListTranslated.isNotEmpty ? textListTranslated[2] : textListOriginal[2], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Text("4.8"),
                          Text("(62)"),
                        ],
                      ),
                      Container(
                        width: 141,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: const Color(0xff189DFD).withOpacity(0.08),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textListTranslated.isNotEmpty ? textListTranslated[3] : textListOriginal[3],
                              style: GoogleFonts.inter(
                                color: const Color(0xff189DFD),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SvgPicture.asset("assets/svg/check_badge.svg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          _isPressed = true;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          _isPressed = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed = false;
                        });
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: _isPressed ? Color(0xff189DFD).withOpacity(0.5) : Color(0xff189DFD),
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textListTranslated.isNotEmpty ? textListTranslated[4] : textListOriginal[4],
                                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.asset("assets/svg/arrow -right.svg", color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(child: Text("ingilizce"),onPressed: (){targetLanguage="en";getTexts();setState(() {});},),
                  TextButton(child: Text("almanca"),onPressed: (){targetLanguage="de";getTexts();setState(() {});},),
                  TextButton(child: Text("fransızca"),onPressed: (){targetLanguage="fr";getTexts();setState(() {});},),
                  TextButton(child: Text("türkçe"),onPressed: (){targetLanguage="tr";getTexts();setState(() {});},)
                ],
              ),
            ),
          ),
        ),
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}