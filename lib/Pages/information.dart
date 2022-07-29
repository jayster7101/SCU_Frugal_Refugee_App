import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final Uri url1 = Uri.parse("https://www.acf.hhs.gov/orr/outreach-material/office-refugee-resettlement-national-call-center");
  final Uri url2 = Uri.parse("https://www.uscis.gov/humanitarian/refugees-and-asylum/refugees");
  final Uri url3 = Uri.parse("https://www.unhcr.org/en-us/how-to-get-help.html");
  final Uri url4 = Uri.parse("https://refugees.org/legal-services/");
  final Uri url5 = Uri.parse("https://refugees.org/refugee-resettlement/");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20, // sets padding to 20 between each container
            alignment: WrapAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 120, // sets height to 120 and width will be size of screen taking padding into consideration
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Hotline",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      launchUrl(url1);
                    },
                  ),
                )),
            SizedBox(
                height: 120, // sets height to 120 and width will be size of screen taking padding into consideration
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "USCIS",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      launchUrl(url2);
                    },
                  ),
                )),
            SizedBox(
                height: 120, // sets height to 120 and width will be size of screen taking padding into consideration
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Getting Help",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      launchUrl(url3);
                    },
                  ),
                )),
            SizedBox(
                height: 120, // sets height to 120 and width will be size of screen taking padding into consideration
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Legal",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      launchUrl(url4);
                    },
                  ),
                )),
            SizedBox(
              height: 120, // sets height to 120 and width will be size of screen taking padding into consideration
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                          style: BorderStyle.solid),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Resettlement",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    launchUrl(url5);
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}