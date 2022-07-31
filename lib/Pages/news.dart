import 'package:starter/Pages/services/newsresult.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
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
            ),
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