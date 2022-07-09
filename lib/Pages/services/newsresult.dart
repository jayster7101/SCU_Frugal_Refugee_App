import 'package:flutter/material.dart';

class NewsResult extends StatefulWidget {
  const NewsResult({Key? key}) : super(key: key);

  @override
  State<NewsResult> createState() => _NewsResultState();
}

class _NewsResultState extends State<NewsResult> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context)!.settings.arguments;
    print(query);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
      ),
    );
  }
}