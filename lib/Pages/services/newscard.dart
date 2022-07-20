import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/// Widget that will encapsulate data from a news
/// entry and will be represented in a Card
class NewsCard extends StatefulWidget {
  final String title;
  final String publisher;
  final String url;

  const NewsCard({Key? key, required this.title, 
    required this.publisher, required this.url}
  ) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  ///Function to launch a URL inside the app,
  ///given a parsed url.
  void _launchUrl(url) async{
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: Text(widget.title),
              subtitle: Text(widget.publisher),
              onTap: (){
                Uri temp = Uri.parse(widget.url);
                _launchUrl(temp);
              },
            ),
          ],
        ),
      ),
    );
  }
}