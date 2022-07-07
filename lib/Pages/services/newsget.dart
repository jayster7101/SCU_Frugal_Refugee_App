import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'apikeys.dart';

class GetNews{
  /// Function that returns a map from a `String` search
  /// with a news API.
  Future<Map> getSearch(String query) async{
    Uri url = Uri.parse("https://free-news.p.rapidapi.com/v1/search?q=$query&lang=en&page=1&page_size=5");
    http.Response response = await http.get(url, 
      headers: {
        "X-RapidAPI-Key": newsApiKey,
        "X-RapidAPI-Host": newsHost,
      }
    );
    Map m = convert.jsonDecode(response.body);
    return m;
  }
}