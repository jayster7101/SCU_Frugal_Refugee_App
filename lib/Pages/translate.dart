import 'package:flutter/material.dart';
import 'services/translateget.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  TranslateGet t = TranslateGet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                t.getTranslate("Hello", "es");
                setState(() {
                  
                });
              },
              child: const Text("test"),
            ),
          ],
        ),
      ),
    );
  }
}