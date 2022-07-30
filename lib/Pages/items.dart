import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final Uri url1 = Uri.parse(
      "https://www.amazon.com/s?k=masks&crid=3KE9WL6BRRKMU&sprefix=mask%2Caps%2C258&ref=nb_sb_noss_1");
  final Uri url2 = Uri.parse(
      "https://www.amazon.com/s?k=bedding&crid=2I4DKCPTXKPCE&sprefix=bedding%2Caps%2C315&ref=nb_sb_noss_1");
  final Uri url3 = Uri.parse(
      "https://www.amazon.com/s?k=shirts&crid=SEFPP4SEEF47&sprefix=shi%2Caps%2C349&ref=nb_sb_noss_2");
  final Uri url4 = Uri.parse(
      "https://www.amazon.com/s?k=pants&crid=1M5JD510K9YHG&sprefix=pa%2Caps%2C330&ref=nb_sb_noss_2");
  final Uri url5 = Uri.parse("https://www.amazon.com/ref=nav_logo");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("Items"),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: SingleChildScrollView(
              child: Wrap(
            runSpacing: 20, // sets padding to 20 between each container
            alignment: WrapAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Masks",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {
                        launchUrl(url1);
                      },
                    ),
                  )),
              SizedBox(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Bedding",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {
                        launchUrl(url2);
                      },
                    ),
                  )),
              SizedBox(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Shirts",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {
                        launchUrl(url3);
                      },
                    ),
                  )),
              SizedBox(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Pants",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {
                        launchUrl(url4);
                      },
                    ),
                  )),
              SizedBox(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Amazon",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {
                        launchUrl(url5);
                      },
                    ),
                  )),
            ],
          )),
        ));
  }
}
