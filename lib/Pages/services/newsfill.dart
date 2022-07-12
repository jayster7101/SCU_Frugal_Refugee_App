import 'newscard.dart';
/// Class to take a map, return a child of cards with news.
class NewsFill{
  /// Method to take map of news data, put in List of `NewsCard` widgets <br>
  /// **Note: Publisher is left blank due to null errors** 
  List<NewsCard> getNews(Map map){
    List<NewsCard> cards = [];
    for (int i = 0; i < map["articles"].length; i++){
      NewsCard card = NewsCard(title: map["articles"][i]["title"], publisher: "", url: map["articles"][i]["link"]);
      cards.add(card);
    }
    return cards;
  }
}