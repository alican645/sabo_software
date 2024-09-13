

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TekneSecPage extends StatefulWidget {
  TekneSecPage({super.key});

  @override
  State<TekneSecPage> createState() => _TekneSecPageState();
}

class _TekneSecPageState extends State<TekneSecPage> {
  final TextStyle _totalCommentTextStyle = GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff526675));
  final TextStyle _totalNumberOfCommentTextStyle = GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff1A2228));
  final TextStyle _mainTitleTextStyle = GoogleFonts.interTight(
      fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xff1A2228));

  final _boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF4F8FA),
      appBar: AppBar(
        title: Text("Tasıtlarım"),
        centerTitle: true,
      ),
      body: Padding(
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
                  Text("Tekne Seç",style: _mainTitleTextStyle,),
                  SizedBox(height: 12,),
                  // Image section
                  Stack(
                    children: [
                      // Boat Image
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

                      // Gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xffF9FCFD).withOpacity(1),  // Darker opacity at the top
                                             // Transparent at the bottom
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 10),

                  // Boat name and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Tekne Adı", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
                              "Doğrulanmış Tekne",
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

                  Row(
                    children: [
                      Text("Toplam Yorum Sayısı:", style: _totalCommentTextStyle),
                      Text("62", style: _totalNumberOfCommentTextStyle),
                    ],
                  ),

                  const SizedBox(height: 20),


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
                                "Yorumları Görüntüle",
                                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              SizedBox(width: 10,),
                              SvgPicture.asset("assets/svg/arrow -right.svg",color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


