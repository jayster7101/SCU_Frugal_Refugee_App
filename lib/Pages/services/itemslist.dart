import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemsList{
  final Uri _url1 = Uri.parse("https://www.amazon.com/s?k=masks&crid=5KQ0NM1BGW5R&sprefix=mask%2Caps%2C126&ref=nb_sb_noss_1");
  final Uri _url2 = Uri.parse("https://www.amazon.com/s?k=blanket&crid=337G5AZ3W6IQB&sprefix=blanke%2Caps%2C139&ref=nb_sb_noss_2");
  final Uri _url3 = Uri.parse("https://www.amazon.com/s?k=shirts&crid=1AW7L1T6KV1VV&sprefix=shirt%2Caps%2C186&ref=nb_sb_noss_1");
  final Uri _url4 = Uri.parse("https://www.amazon.com/s?k=pants&crid=37NUFE02MX5SF&sprefix=pant%2Caps%2C168&ref=nb_sb_noss_1");

  ///Function to launch a URL inside the app,
  ///given a parsed url.
  void _launchUrl(url) async{
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  ///Function to return a List of card widgets,
  ///Having this would prevent lines of code being 
  ///put into the main items file.
  List<Widget> getList(){
    return [
      Card(
        child: InkWell(
          onTap: () => _launchUrl(_url1),
          child: const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "Masks"
              ),
            ),
          ),
        ),
      ),
      Card(
        child: InkWell(
          onTap: () => _launchUrl(_url2),
          child: const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "Blankets"
              ),
            ),
          ),
        ),
      ),
      Card(
        child: InkWell(
          onTap: () => _launchUrl(_url3),
          child: const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "Shirts"
              ),
            ),
          ),
        ),
      ),
      Card(
        child: InkWell(
          onTap: () => _launchUrl(_url4),
          child: const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "Pants"
              ),
            ),
          ),
        ),
      ),
      
    ];
  }
}