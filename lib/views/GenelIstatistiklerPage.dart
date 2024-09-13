import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GenelIstatistiklerPage extends StatefulWidget {
  const GenelIstatistiklerPage({Key? key}) : super(key: key);

  @override
  _GenelIstatistiklerPageState createState() => _GenelIstatistiklerPageState();
}

class _GenelIstatistiklerPageState extends State<GenelIstatistiklerPage> {

  final TextStyle _numberStyle = GoogleFonts.inter(fontSize: 25,fontWeight: FontWeight.w700,color: Color(0xff1A2228));
  final TextStyle _titleStyle = GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff526675));
  final TextStyle _profitStyle = GoogleFonts.inter(fontSize: 11,fontWeight: FontWeight.w400);
  final TextStyle _notCompletedStyle = GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff1A2228));
  final TextStyle _completedStyle = GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff526675));
  final TextStyle _profileTitleStyle = GoogleFonts.interTight(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xff1A2228));
  
  final bool _isProfit = true;
  final bool _isCompleted = false;
  
  final _boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF4F8FA),
      appBar: AppBar(
        leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
      ),
        backgroundColor: Color(0xFFF4F8FA),
        title: Text('Genel İstatistikler'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(

          child: Column(
            children: [
              _buildContainer(
                size: size,
                title: "Aylık Kazanç",
                number: "87.7000",
                isProfit: true,
                iconPath: 'assets/svg/money-paper.svg',
              ),
              SizedBox(height: 12,),  
              _buildContainer(
                size: size,
                title: "Aylık Rezervasyon",
                number: "27",
                isProfit: false,
                iconPath: 'assets/svg/ship.svg',
              ),
              SizedBox(height: 12,),  
              _buildContainer(
                size: size,
                title: "Aylık Teklif",
                number: "65",
                isProfit: true,
                iconPath: 'assets/svg/clock-dash.svg',
                ),
              SizedBox(height: 12,),  
              _buildContainer(
                size: size,
                title: "Yorum Ortalaması",
                number: "4.8",
                isProfit: true,
                iconPath: 'assets/svg/star.svg',
              ),
              SizedBox(height: 12,),  
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: _boxDecoration,
                width: size.width,
                child:Padding(padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Profili Tamamla",style: _profileTitleStyle,),
                    _buildProfileContainer(size: size,isCompleted: true,content: "Şirket Bilgilerini Ekleyin",),
                      _buildProfileContainer(size: size,isCompleted: false,content: "Profil Bilgilerinizi Güncelleyin",),
                      _buildProfileContainer(size: size,isCompleted: true,content: "Teknenizi Ekleyin",),
                        _buildProfileContainer(size: size,isCompleted: true,content: " Teknenizin Fiyatlarını Ekleyin",),
                      _buildProfileContainer(size: size,isCompleted: false,content: "Teknenizin Müsaitliğini Düzenleyin",),
                ],),
                ),
              )
                
             )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProfileContainer(
    {required Size size,required bool isCompleted,required String content}
    ) {
    return Container(
                    width: size.width,
                    height: 56,
                    decoration: _boxDecoration.copyWith(color:Color(0xffF9FCFD)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(content,style: isCompleted==true ? _completedStyle   : _notCompletedStyle,),
                      SvgPicture.asset(isCompleted==true ? 'assets/svg/completed_icon.svg' : 'assets/svg/arrow -right.svg')
                    ],),
                  );
  }

  Padding _buildContainer(
    {required Size size,required String title,required String number,required bool isProfit,required String iconPath}
    ) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: size.width,
              decoration: _boxDecoration,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xff189DFD).withOpacity(0.08),
                      child: SvgPicture.asset(iconPath),
                    ),
                    SizedBox(height: 10,),
                    Text(title,style: _titleStyle,),
                    Text(number,style: _numberStyle,),
                    Container(
                      width: 101,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: isProfit==true ? Color(0xff49CA56).withOpacity(0.08) : Color(0xffF44336).withOpacity(0.08),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(isProfit==true ? 'assets/svg/arrow-up.svg' : 'assets/svg/two_line.svg'),
                        Text("%35 diğer ay",style: _profitStyle.copyWith(color: isProfit==true ? Color(0xff49CA56) : Color(0xffF44336)),),
                      ],),
                    )

              
                ],)
            ),
          ),
          );
  }
}
