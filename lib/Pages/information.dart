import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20, // sets padding to 20 between each container
            alignment: WrapAlignment.spaceBetween,
            children: [
              Container(
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
                        textStyle: TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Pharmacy",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {},
                  ),
                )),
            Container(
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
                        textStyle: TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Hospital",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {},
                  ),
                )),
            Container(
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
                        textStyle: TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Mental Health",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {},
                  ),
                )),
            Container(
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
                        textStyle: TextStyle(fontSize: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Dental",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {},
                  ),
                )),
            Container(
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
                      textStyle: TextStyle(fontSize: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Nursing Homes",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
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