

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TasitlarDetayPage extends StatefulWidget {
  TasitlarDetayPage({super.key});
  int isletmeTipiValue = 0;

  @override
  State<TasitlarDetayPage> createState() => _TasitlarDetayPageState();
}

class _TasitlarDetayPageState extends State<TasitlarDetayPage> {
  bool _isPressed = false;

  // Dropdown menüsünde gösterilecek öğeler
  final List<String> _itemListModel = [
    "Item 1 ListModel",
    "Item 2 ListModel",
    "Item 3 ListModel",
    "Item 4 ListModel"
  ];
  String? _selectedItemModel ;

  final List<String> _itemListTasitTipi = [
    "Item 1 TasitTipi",
    "Item 2 TasitTipi",
    "Item 3 TasitTipi",
    "Item 4 TasitTipi"
  ];
  String? _selectedItemTasitTipi ;

  final List<String> _itemListYapiModel = [
    "Item 1 YapiModel",
    "Item 2 YapiModel",
    "Item 3 YapiModel",
    "Item 4 YapiModel"
  ];
  String? _selectedItemYapiModel ;

  String? _selectedItemBayrak ; // Türkiye
  final List<Map<String, String>> _itemListBayrak = [
    {'name': 'Turkey', 'code': 'tr'},
    {'name': 'Germany', 'code': 'de'},
    {'name': 'United States', 'code': 'us'},
    {'name': 'France', 'code': 'fr'},
  ];

  final TextEditingController _tamKapasiteController = TextEditingController();
  final TextEditingController _yemekliKapasiteController =
  TextEditingController();
  final TextEditingController _tasitAdiController = TextEditingController();
  final TextEditingController _markaController = TextEditingController();
  final TextEditingController _yapimTiliContoller = TextEditingController();
  final TextEditingController _bakimOnarimYiliController =
  TextEditingController();
  final TextEditingController _tasitUzunluguController =
  TextEditingController();
  final TextEditingController _tuvaletSayisiController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    double mqWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FA),
      appBar: AppBar(
        title: Text(
          "Taşıtlarım",
          style: GoogleFonts.interTight(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1A2228)),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>İşletme Tipi
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Container(
                      width: mqWidth * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "İşletme Tipi",
                                    style: GoogleFonts.interTight(
                                        fontSize: 17, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                        "assets/svg/info_circle.svg"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: mqWidth * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.isletmeTipiValue = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: widget.isletmeTipiValue == 1
                                              ? const Color(0xff189DFD)
                                              .withOpacity(0.08)
                                              : Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(16)),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/time_circle.svg",
                                            color: widget.isletmeTipiValue == 1
                                                ? const Color(0xff189DFD)
                                                : Color(0xff526675),
                                          ),
                                          Text(
                                            "Saatlik",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: widget.isletmeTipiValue == 1?FontWeight.w500:FontWeight.w400,
                                              color:
                                              widget.isletmeTipiValue == 1
                                                  ? const Color(0xff189DFD)
                                                  : Color(0xff526675),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.isletmeTipiValue = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: widget.isletmeTipiValue == 2
                                              ? const Color(0xff189DFD)
                                              .withOpacity(0.08)
                                              : Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(16)),
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/calendar.svg",
                                            color: widget.isletmeTipiValue == 2
                                                ? const Color(0xff189DFD)
                                                : Color(0xff526675),
                                          ),
                                          Text(
                                            "Günlük & Haftalık",
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: widget.isletmeTipiValue == 2?FontWeight.w500:FontWeight.w400,
                                              color:
                                              widget.isletmeTipiValue == 2
                                                  ? const Color(0xff189DFD)
                                                  : Color(0xff526675),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Tam Kapasite
              Container(
                width: mqWidth * 0.9,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: _buildTextField(
                    hintText: "Tam Kapasite",
                    paddingZero: true,
                    mqWidth: mqWidth,
                    title: "Tam Kapasite",
                    icon: ImageIcon(AssetImage("assets/images/user.png")),
                    textInputType: TextInputType.number,
                    textEditingController: _tamKapasiteController),
              ),
              const SizedBox(
                height: 12,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Yemekli Kapasite
              Container(
                width: mqWidth * 0.9,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: _buildTextField(
                    hintText: "Yemekli Kapasite",
                    paddingZero: true,
                    mqWidth: mqWidth,
                    title: "Yemekli Kapasite",
                    icon: ImageIcon(AssetImage("assets/images/knife_fork.png")),
                    textInputType: TextInputType.number,
                    textEditingController: _yemekliKapasiteController),
              ),
              const SizedBox(
                height: 12,
              ),
              ///////////////////////////////////////////////////////////////////////////>>>>>>>>>Tekne Özellikleri
              Container(
                width: mqWidth * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
                              child: Text("Tekne Özellikleri",
                                  style: GoogleFonts.interTight(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            )),
                        _buildTextField(
                            hintText: "Taşıt Adını Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Taşıt Adı",
                            icon: null,
                            textInputType: TextInputType.text,
                            textEditingController: _tasitAdiController),
                        _buildDropdown(
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemTasitTipi = p0;
                            });
                          },
                          hintText: "Taşıt Tipi Seçiniz",
                          title: "Taşıt Tipi",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemTasitTipi,
                          itemList: _itemListTasitTipi,
                        ),
                        _buildTextField(
                            hintText: "Markayı Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Marka",
                            icon: null,
                            textInputType: TextInputType.text,
                            textEditingController: _markaController),
                        _buildDropdown(
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemModel = p0;
                            });
                          },
                          hintText: "Model Seçiniz",
                          title: "Model",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemModel,
                          itemList: _itemListModel,
                        ),
                        _buildTextField(
                            hintText: "Yapım Yılını Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Yapım Yılı",
                            icon: null,
                            textInputType: TextInputType.number,
                            textEditingController: _yapimTiliContoller),
                        _buildTextField(
                            hintText: "Bakım/Onarım Yılını Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Bakım/Onarım Yılı",
                            icon: null,
                            textInputType: TextInputType.number,
                            textEditingController: _bakimOnarimYiliController),
                        _buildTextField(
                            hintText: "Taşıt Uzunluğunu Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Taşıt Uzunluğu",
                            icon: null,
                            textInputType: TextInputType.number,
                            textEditingController: _tasitUzunluguController),
                        _buildTextField(
                            hintText: "Tuvalet Sayısıni Giriniz",
                            paddingZero: false,
                            mqWidth: mqWidth,
                            title: "Tuvalet Sayısı",
                            icon: null,
                            textInputType: TextInputType.number,
                            textEditingController: _tuvaletSayisiController),
                        _buildDropdownBayrak(
                          title: "Bayrak",
                          mqWidth: mqWidth,
                        ),
                        _buildDropdown(
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemYapiModel = p0;
                            });
                          },
                          hintText: "Yapı Malzemesi Seçiniz",
                          title: "Yapı Malzemesi",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemYapiModel,
                          itemList: _itemListYapiModel,
                        ),
                        SizedBox(height: 12,),
                        GestureDetector(
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
                              width: mqWidth * 0.8,
                              height: 56,
                              decoration: BoxDecoration(
                                color: _isPressed == false
                                    ? Color(0xff189DFD)
                                    : Color(0xff189DFD).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: Center(
                                  child: Text("Değişiklikleri Kaydet",
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)))),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Padding _buildTextField({
    required bool paddingZero,
    required double mqWidth,
    required String title,
    required Widget? icon,
    required TextInputType textInputType,
    required TextEditingController textEditingController,
    required String hintText}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Başlık ile hizalanması için
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
            child: Text(title, style: paddingZero == true ? GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff1A2228)) : GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xff526675))),
          ),
          Container(
            width: mqWidth * 0.8,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: Padding(
              padding: paddingZero == true
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                style:GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff1A2228)),
                controller: textEditingController,
                keyboardType: textInputType,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff526675)),
                  prefixIcon: icon, // Soldaki ikon
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Padding _buildDropdown({
    required String title, // Dropdown başlığı
    required double mqWidth, // Ekran genişliği
    required String? selectedValue, // Seçilen değer
    required List<String> itemList,
    required String hintText,// Dropdown'a ait veriler
    required Function(String?) onChangedCallback
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
            child: Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff526675)),
            ),
          ),
          Container(
            width: mqWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color:selectedValue != null ? const Color(0xff189DFD)  :Colors.grey.shade300 , width: 1.5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                hint: Text(hintText),
                value: selectedValue, // Seçilen değer
                icon: Icon(selectedValue != null ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,),
                isExpanded: true, // Genişliği doldurması için
                items: itemList.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff1A2228),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  onChangedCallback(newValue);
                }, // Seçim değiştiğinde tetiklenen callback
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildDropdownBayrak({
    required String title,
    required double mqWidth,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
              child: Text(
                title,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff526675)),
              ),
            ),
          ),
          Container(
            width: mqWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color:_selectedItemBayrak != null ? Color(0xff189DFD)  :Colors.grey.shade300,
                  width: 1.5),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none, // Border'ı kaldırmak için
                ),
                filled: true, // Arka plan rengini doldurur
                fillColor: Colors.white, // Arka plan rengi
              ),
              hint: Text("Ülke Seçiniz"),
              value: _selectedItemBayrak,
              icon: Icon(_selectedItemBayrak != null ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,),
              isExpanded: true, // Tüm genişliği kaplaması için
              items: _itemListBayrak.map((country) {
                return DropdownMenuItem<String>(
                  value: country['code'],
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'icons/flags/svg/${country['code']}.svg',
                        package: 'country_icons',
                        width: 30,
                        height: 20,
                      ),
                      SizedBox(
                        width: mqWidth * 0.05,
                      ),
                      Text(
                        country['name']!,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xff1A2228),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItemBayrak = newValue!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
