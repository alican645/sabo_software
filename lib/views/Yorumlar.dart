import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/CommentModel.dart';

class YorumlarPage extends StatefulWidget {
  YorumlarPage({super.key});

  @override
  State<YorumlarPage> createState() => _YorumlarPageState();
}

class _YorumlarPageState extends State<YorumlarPage> {
  final TextStyle _nameTextStyle = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff1A2228));

  final TextStyle _dateTextStyle = GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff526675));

  final TextStyle _commentTextStyle = GoogleFonts.inter(
      fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xff1A2228));

  final TextStyle _mainTitleTextStyle = GoogleFonts.interTight(
      fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xff1A2228));

  final _boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  bool _isPressed = false;

  // Gösterilecek yorumların sayısı
  int _visibleComments = 6;

  List<CommentModel> commentList = [
  CommentModel(
  userName: "JohnDoe",
  commentDate: "2024-09-12",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 5,
  ),
  CommentModel(
  userName: "JaneSmith",
  commentDate: "2024-09-11",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 3,
  ),
  CommentModel(
  userName: "MikeBrown",
  commentDate: "2024-09-10",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 1,
  ),
  CommentModel(
  userName: "SarahJohnson",
  commentDate: "2024-09-09",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge. detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his r detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.,ights and upon his honour obligations and of any criminal charge.",
  commentScore: 4,
  ),
  CommentModel(
  userName: "DavidWilson",
  commentDate: "2024-09-08",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 3,
  ),
  CommentModel(
  userName: "EmilyDavis",
  commentDate: "2024-09-07",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 5,
  ),
  CommentModel(
  userName: "ChrisMiller",
  commentDate: "2024-09-06",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 4,
  ),
  CommentModel(
  userName: "EmmaWhite",
  commentDate: "2024-09-05",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 2,
  ),
  CommentModel(
  userName: "NoahLee",
  commentDate: "2024-09-04",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 3,
  ),
  CommentModel(
  userName: "OliviaClark",
  commentDate: "2024-09-03",
  comment:
  "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
  commentScore: 5,),
    CommentModel(
      userName: "NoahLee",
      commentDate: "2024-09-04",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 3,
    ),
    CommentModel(
      userName: "OliviaClark",
      commentDate: "2024-09-03",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 5,
    ),
    CommentModel(
      userName: "JohnDoe",
      commentDate: "2024-09-12",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 5,
    ),
    CommentModel(
      userName: "JaneSmith",
      commentDate: "2024-09-11",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 3,
    ),
    CommentModel(
      userName: "MikeBrown",
      commentDate: "2024-09-10",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 1,
    ),
    CommentModel(
      userName: "SarahJohnson",
      commentDate: "2024-09-09",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 4,
    ),
    CommentModel(
      userName: "EmmaWhite",
      commentDate: "2024-09-05",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
      commentScore: 2,
    ),
    CommentModel(
      userName: "NoahLee",
      commentDate: "2024-09-04",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
      commentScore: 3,
    ),
    CommentModel(
      userName: "OliviaClark",
      commentDate: "2024-09-03",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile. Everyone is entitled in full equality to a fair and public hearing by an independent and impartial tribunal, in the determination of his rights and upon his honour obligations and of any criminal charge.",
      commentScore: 5,),
    CommentModel(
      userName: "DavidWilson",
      commentDate: "2024-09-08",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 3,
    ),
    CommentModel(
      userName: "EmilyDavis",
      commentDate: "2024-09-07",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 5,
    ),
    CommentModel(
      userName: "ChrisMiller",
      commentDate: "2024-09-06",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 4,
    ),
    CommentModel(
      userName: "EmmaWhite",
      commentDate: "2024-09-05",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 2,
    ),
    CommentModel(
      userName: "NoahLee",
      commentDate: "2024-09-04",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 3,
    ),
    CommentModel(
      userName: "OliviaClark",
      commentDate: "2024-09-03",
      comment:
      "No one shall be subjected to arbitrary arrest, detention or exile.",
      commentScore: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF4F8FA),
      appBar: AppBar(
        title: Text("Tekne Yorumları"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(20),
          decoration: _boxDecoration,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tekne Yorumları",
                  style: _mainTitleTextStyle,
                ),
                // Yorumları göster
                ...List.generate(
                  _visibleComments.clamp(0, commentList.length), // Görüntülenen yorum sayısı
                      (index) => _buildCommentContainer(
                    size: size,
                    index: index,
                    commentModel: commentList[index],
                  ),
                ),
                // Eğer tüm yorumlar yüklendiyse "Daha Fazla Yükle" butonunu gösterme
                if (_visibleComments < commentList.length)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
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
                        // Daha fazla yorum yükle
                        _loadMoreComments();
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
                            "Daha Fazla Yükle",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
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
    );
  }

  // Yorumları 6 adet daha yükler
  void _loadMoreComments() {
    setState(() {
      _visibleComments += 6;
    });
  }

  Padding _buildCommentContainer({
    required Size size,
    required int index,
    required CommentModel commentModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: size.width,
        decoration: _boxDecoration.copyWith(
          color: Color(0xffF9FCFD),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  commentModel.userName.toString(),
                  style: _nameTextStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  commentModel.commentDate.toString(),
                  style: _dateTextStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: List.generate(
                    commentModel.commentScore!,
                        (index) => SvgPicture.asset("assets/svg/comment_star.svg"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              commentModel.comment.toString(),
              style: _commentTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
