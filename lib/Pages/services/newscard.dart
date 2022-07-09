import 'package:flutter/material.dart';
import 'newsget.dart';
/// Widget that will encapsulate data from a news
/// entry and will be represented in a Card
class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text("News"),
              subtitle: Text("Subtitle"),
            ),
          ],
        ),
      ),
    );
  }
}