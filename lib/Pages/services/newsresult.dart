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

  /// Method to fill a list of `NewsCard` widgets w/ async <br>
  /// After the list is filled, a delay is put in place, then
  /// a `setState` is called to update the screen.
  Future<List<NewsCard>> fillList(var query) async {
    try {
      list = newsFill.getNews(await newsGet.getSearch(query));
    } catch (e) {
      throw Exception("Could not find news");
    }
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {});
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context)!.settings.arguments;
    fillList(query);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}
