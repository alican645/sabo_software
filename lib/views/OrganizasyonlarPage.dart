

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizasyonlarPage extends StatefulWidget {
  const OrganizasyonlarPage({super.key});

  @override
  State<OrganizasyonlarPage> createState() => _OrganizasyonlarPageState();
}

class _OrganizasyonlarPageState extends State<OrganizasyonlarPage> {
  String organizasyonlarTitle = "Organizasyonlar";
  bool organizasyonlarContent1 = false;
  bool organizasyonlarContent2 = false;
  bool organizasyonlarContent3 = false;
  List<bool> organizasyonlarContentValueList = [];
  List<String> organizasyonlarTexts = [
    "Dışarıdan catering firması getirilemez",
    "Mangal Yapılamaz",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir"
  ];

  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
    organizasyonlarContentValueList = [
      organizasyonlarContent1,
      organizasyonlarContent2,
      organizasyonlarContent3
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: Text("Taşıtlarım"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          child:Column(
            children: [
              _buildCheckboxContainer(organizasyonlarTitle,organizasyonlarContentValueList , organizasyonlarTexts)
            ],
          )
      ),
    );
  }

  Widget _buildCheckboxContainer(
      String title, List<bool> checkboxValues, List<String> contentTexts) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(child: SvgPicture.asset("assets/svg/info_circle.svg"),onTap:(){})
              ],
            ),
            ...List.generate(
              contentTexts.length,
                  (index) => CheckboxListTile(
                activeColor: Color(0xFF49CA56),
                contentPadding: EdgeInsets.zero,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                title: Text(contentTexts[index]),
                value: checkboxValues[index],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[index] = value!;
                    print(title);
                    print(contentTexts[index]);
                    print(checkboxValues[index]);
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
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
                  // Tıklama sonrasında yapılacak işlem
                },
                onTapCancel: () {
                  setState(() {
                    _isPressed = false;
                  });
                },
                child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isPressed == false
                          ? Color(0xff189DFD)
                          : Color(0xff189DFD).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                        child: Text(
                          "Değişiklikleri Kaydet",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}