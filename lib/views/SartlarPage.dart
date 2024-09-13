import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SartlarPage extends StatefulWidget {
  const SartlarPage({super.key});

  @override
  State<SartlarPage> createState() => _SartlarPageState();
}

class _SartlarPageState extends State<SartlarPage> {
  final List<String> _itemListIptalPolitikasi = [
    "Item 1 IptalPolitikasi",
    "Item 2 IptalPolitikasi",
    "Item 3 IptalPolitikasi",
    "Item 4 IptalPolitikasi"
  ];
  String? _selectedIptalPolitikasi;

  final List<String> _itemListMinKiSu = [
    "Item 1 MinKiSu",
    "Item 2 MinKiSu",
    "Item 3 MinKiSu",
    "Item 4 MinKiSu"
  ];
  String? _selectedItemMinKiSu;

  final List<String> _itemListMinKiSu2 = [
    "Item 1 MinKiSu2",
    "Item 2 MinKiSu2",
    "Item 3 MinKiSu2",
    "Item 4 MinKiSu2"
  ];
  String? _selectedItemMinKiSu2;

  final List<String> _itemListTurSartlari = [
    "Item 1 TurSartlari",
    "Item 2 TurSartlari",
    "Item 3 TurSartlari",
    "Item 4 TurSartlari"
  ];
  String? _selectedItemTurSartlari;

  String hizmetlerTitle = "Hizmetler";
  bool hizmetlerContent1 = false;
  bool hizmetlerContent2 = false;
  bool hizmetlerContent3 = false;
  List<bool> hizmetlerContentValueList = [];
  List<String> hizmetlerTexts = [
    "Dışarıdan catering firması getirilemez",
    "Mangal Yapılamaz",
    "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir"
  ];

  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
    hizmetlerContentValueList = [
      hizmetlerContent1,
      hizmetlerContent2,
      hizmetlerContent3
    ];
  }

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
              Container(
                  width: mqWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 10),
                              child: Text("Kiralama Şartları",
                                  style: GoogleFonts.interTight(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            )),
                        _buildDropdown(
                          title: "İptal Politikası",
                          mqWidth: mqWidth,
                          selectedValue: _selectedIptalPolitikasi,
                          itemList: _itemListIptalPolitikasi,
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedIptalPolitikasi=p0;
                            });
                          },
                          hintText: "Lütfen İptal Politikasını Seçiniz"
                        ),
                        _buildDropdown(
                          title: "Minimum Kiralama Sresi",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemMinKiSu,
                          itemList: _itemListMinKiSu,
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemMinKiSu=p0;
                            });
                          },
                          hintText: "Lütfen Kiralama Süresini Seçiniz"
                        ),
                        _buildDropdown(
                          title: "Özel Günler için Minimum Kiralama Süresi",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemMinKiSu2,
                          itemList: _itemListMinKiSu2,
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemMinKiSu2=p0;
                            });
                          },
                          hintText: "Lütfen Kiralama Süresini Seçiniz"
                        ),
                        _buildDropdown(
                          title: "Tur Şartları",
                          mqWidth: mqWidth,
                          selectedValue: _selectedItemTurSartlari,
                          itemList: _itemListTurSartlari,
                          onChangedCallback: (p0) {
                            setState(() {
                              _selectedItemTurSartlari = p0;
                            });
                          },
                          hintText: "Lütfen Tur Şartlarını Seçiniz",
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 12,
              ),
              _buildCheckboxContainer(
                  title: "Kullanım Şartları",
                  checkboxValues: hizmetlerContentValueList,
                  contentTexts: hizmetlerTexts),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxContainer(
      {required String title,
      required List<bool> checkboxValues,
      required List<String> contentTexts}) {
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600, fontSize: 17),
              ),
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
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

  Padding _buildDropdown(
      {required String title, // Dropdown başlığı
      required double mqWidth, // Ekran genişliği
      required String? selectedValue, // Seçilen değer
      required List<String> itemList,
      required String hintText, // Dropdown'a ait veriler
      required Function(String?) onChangedCallback}) {
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
              border: Border.all(
                  color: selectedValue != null
                      ? const Color(0xff189DFD)
                      : Colors.grey.shade300,
                  width: 1.5),
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
                icon: Icon(
                  selectedValue != null
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                ),
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
}
