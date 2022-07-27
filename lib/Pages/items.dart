import 'package:flutter/material.dart';
import 'services/itemslist.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  ItemsList list = ItemsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: list.getList(),
        ),
      ),
    );
  }
}