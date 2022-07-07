import 'package:flutter/material.dart';

class Health_Locations extends StatefulWidget {
  const Health_Locations({Key? key}) : super(key: key);

  @override
  State<Health_Locations> createState() => _Health_LocationsState();
}

class _Health_LocationsState extends State<Health_Locations> {
  List text = ["Jayden", "Erika", "Cameron", "Aiden"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Pharmacies"),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        body: ListView.builder(
          itemCount: text.length,
          itemBuilder: ((context, index) {
            return Container(
              height: 95,
              width: 414,
              // color: Colors.blueAccent,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, style: BorderStyle.solid, color: Colors.black)),
              //color: Colors.red,

              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                              child: Container(
                                child: Center(

                                 // widthFactor: double.infinity,
                                  child: Icon(Icons.start,size:50,color: Colors.purple,)),
                            color: Colors.red,
                          )),
                          Expanded(
                            flex: 1,
                              child: Container(
                               width: double.infinity,
                            color: Colors.blue,
                                child: const Center(
                                  child: Text("Hello"),),
                                
                          )),
                        ],
                      )),
                  // Expanded(
                  //     flex: 2,
                  //     child:
                  //     Container(
                  //       height: double.maxFinite,
                  //       color: Colors.red,
                  //       child:

                  //       Column(children: [
                  //           Container(
                  //             margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  //             height: 66,
                  //             width: 68,
                  //             color: Colors.pink,
                  //             child: Icon(Icons.mp_sharp),
                  //           ),

                  //       ]),
                  //     )
                  //     ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        //height: 80,
                        color: Colors.black,
                      )),
                ],
              ),
            );
          }),
        ) // dynamic using yelp api
        );
  }
}
