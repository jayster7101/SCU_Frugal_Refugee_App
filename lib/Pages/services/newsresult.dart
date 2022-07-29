import 'package:flutter/material.dart';
import 'package:starter/Pages/services/newsget.dart';
import 'newscard.dart';
import 'newsfill.dart';

class NewsResult extends StatefulWidget {
  const NewsResult({Key? key}) : super(key: key);

  @override
  State<NewsResult> createState() => _NewsResultState();
}

class _NewsResultState extends State<NewsResult> {
  NewsGet newsGet = NewsGet();
  NewsFill newsFill = NewsFill();
  List<NewsCard> list = [];
  bool isLoad = true;

  /// Method to fill a list of `NewsCard` widgets w/ async <br>
  /// After the list is filled, a delay is put in place, then
  /// a `setState` is called to update the screen.
  Future<List<NewsCard>> fillList(var query) async {
    try {
      list = await newsFill.getNews(await newsGet.getSearch(query));
    } catch (e) {
      throw Exception("Could not find news");
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String query = ModalRoute.of(context)!.settings.arguments as String;
    fillList(query).then((value){
      setState((){
        isLoad = false;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(query),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: (isLoad) ? const [SizedBox(height: 12), Center(child: CircularProgressIndicator())] : list,
        ),
      ),
    );
  }
}
