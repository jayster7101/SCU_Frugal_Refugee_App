import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apikeys.dart';
/// Class to handle API requests to Microsoft Cloud Translater
class TranslateGet{
  /// Method that returns a map with translated text from query
  Future<Map> getTranslate(String query, String lang) async {
    Uri url = Uri.parse(
      "https://microsoft-translator-text.p.rapidapi.com/translate?to%5B0%5D=$lang&api-version=3.0&profanityAction=NoAction&textType=plain"
    );
    String body = convert.jsonEncode({"Text": query});
    http.Response response = await http.post(url,
      body: body,
      headers: {
        "Content-type": "application/json",
        "X-RapidAPI-Key": translateApiKey,
        "X-RapidAPI-Host": translateHost,
      }
    );
    Map m = convert.jsonDecode(response.body);
    print(m);
    return m;
  }
}