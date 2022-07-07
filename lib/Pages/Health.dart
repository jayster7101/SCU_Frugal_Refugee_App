import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starter/Pages/Health_Locations.dart';

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("Health"),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: SingleChildScrollView(
              child: Wrap(
            runSpacing: 20, // sets padding to 20 between each container
            alignment: WrapAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Pharmacy",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Health_Locations()));
                      },
                    ),
                  )),
              Container(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Pharmacy",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onPressed: () {},
                    ),
                  )),
              Container(
                  height:
                      120, // sets height to 120 and width will be size of screen taking padding into consideration
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                              style: BorderStyle.solid),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        "Pharmacy",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onPressed: () {},
                    ),
                  )),
            ],
          )),
        ));
  }
}
