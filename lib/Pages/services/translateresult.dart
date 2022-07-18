import 'package:flutter/material.dart';

class TranslateResult extends StatefulWidget {
  const TranslateResult({Key? key}) : super(key: key);

  @override
  State<TranslateResult> createState() => _TranslateResultState();
}

class _TranslateResultState extends State<TranslateResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
    );
  }
}