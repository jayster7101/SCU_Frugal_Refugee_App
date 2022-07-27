import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apikeys.dart';
/// Class to handle API requests to Microsoft Cloud Translater
class TranslateGet{
  /// Method that returns a map with translated text from query
  Future<Map> getTranslate(String query, String lang1, String lang2) async {
    Uri url = Uri.parse(
      "https://deep-translate1.p.rapidapi.com/language/translate/v2"
    );
    String body = convert.jsonEncode({"q": query, "source":lang1, "target":lang2});
    http.Response response = await http.post(url,
      body: body,
      headers: {
        "Content-type": "application/json",
        "X-RapidAPI-Key": translateApiKey,
        "X-RapidAPI-Host": translateHost,
      }
    );
    if (response.statusCode == 200){
      Map m = convert.jsonDecode(response.body);
      return m;
    }
    else{
      throw Exception("Failed to obtain translation.");
    }
    
  }
}