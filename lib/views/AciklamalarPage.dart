

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AciklamalarPage extends StatefulWidget {
  const AciklamalarPage({super.key});

  @override
  State<AciklamalarPage> createState() => _AciklamalarPageState();
}

class _AciklamalarPageState extends State<AciklamalarPage> {
  final TextEditingController _trAciklmaController = TextEditingController();
  final TextEditingController _enAciklamaController = TextEditingController();

  bool _isPressed=false;

  @override
  Widget build(BuildContext context) {
    double mqWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: Text("Taşıtlarım"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Container(
          width: mqWidth * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Açıklamalar",
                            style: GoogleFonts.interTight(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1A2228)),
                          ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(child: SvgPicture.asset("assets/svg/info_circle.svg"),onTap:(){})
                      ],
                    ),
                    _buildTextField(title: "Türkçe Açıklama",textEditingController: _trAciklmaController),
                    _buildTextField(title: "İngilizce Açıklama",textEditingController: _enAciklamaController),
                    SizedBox(height: 22,),
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
            ),
          ),
        ),
      ),
    );
  }

  Column _buildTextField({required TextEditingController textEditingController,required String title}) {
    return Column(children: [
      SizedBox(
        height: 22,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xff526675)),
        ),
      ),
      SizedBox(
        height: 14,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
          Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              minLines: 1, // Minimum satır sayısı
              maxLines: null, // Sınırsız satır sayısı
              expands: false, // İçeriğe göre büyür
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:5,right:5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset("assets/svg/two_line.svg"),
              ),
            )
          ],
        ),
      ),
    ],);
  }
}
