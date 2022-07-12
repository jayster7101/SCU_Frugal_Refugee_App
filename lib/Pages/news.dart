import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starter/Pages/services/newsresult.dart';
import 'services/newscard.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  String query = "";
  late TextEditingController _controller;
  /// Function to initiate `TextEditiingController`
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  /// Function to remove controller after finished use
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              onFieldSubmitted: (String value){
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => const NewsResult(),
                    settings: RouteSettings(
                      arguments: value,
                    )
                  ),
                );
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search for news", 
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => const NewsResult(),
                    settings: RouteSettings(
                      arguments: _controller.text,
                    )
                  ),
                );
              }, 
              child: const Text("Search"),
            ),
          ],
        )
      ),
    );
  }
}