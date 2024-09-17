import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleTranslateServiceWithTextList {
  final String apiKey = 'AIzaSyDMLgImloSoP-FuA-PPUGMKzoEZIfMnvXE'; // Buraya Google Translate API anahtarınızı ekleyin

  // Tek bir metni çeviren fonksiyon
  Future<String?> translateText(String text, String targetLanguage) async {
    final String url =
        'https://translation.googleapis.com/language/translate/v2?key=$apiKey';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'q': text,
        'target': targetLanguage, // Hedef dil (örneğin: 'tr' - Türkçe)
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['data']['translations'][0]['translatedText']; // Çevirilen metin
    } else {
      print('Çeviri başarısız: ${response.statusCode}');
      return null;
    }
  }

  // Listeyi çeviren fonksiyon
  Future<List<String?>> translateTextList(List<String> textList, String targetLanguage) async {
    List<String?> translatedList = [];

    for (String text in textList) {
      String? translatedText = await translateText(text, targetLanguage);
      translatedList.add(translatedText);
    }

    return translatedList;
  }
}
