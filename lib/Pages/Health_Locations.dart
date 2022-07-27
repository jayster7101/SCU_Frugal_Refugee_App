import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:map_launcher/map_launcher.dart';
import 'package:starter/mockData.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:starter/functions/get_pharamacy_location.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

Position? _position;

class Health_Locations extends StatefulWidget {
  final String place;
  const Health_Locations({Key? key, required this.place}) : super(key: key);

  @override
  State<Health_Locations> createState() => _Health_LocationsState();
}

class _Health_LocationsState extends State<Health_Locations> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();

    // print("wasssup");
    //print(locations[0].image);

    // get_pharma_location("Sanfrancisco");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.place),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        body: Container(
            child: FutureBuilder(
          future: _getCurrentLocation().then(
            (current_p) => get_pharma_location(current_p, widget.place),
          ),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else
              return ListView.builder(
                itemCount: locations.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 209, 209),
                        borderRadius: BorderRadius.all(Radius.circular(12))),

                    height: 100,
                    width: 414,
                    // color: Colors.blueAccent,
                    // decoration: BoxDecoration(
                    //     border: Border.all(
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //         color: Colors.black)),
                    // color: Colors.grey,

                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Colors.transparent,
                                      padding: EdgeInsets.fromLTRB(5, 4, 0, 0),
                                      child: Center(
                                          heightFactor: 100,
                                          widthFactor: 100,

                                          // widthFactor: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              locations[index].image,
                                              fit: BoxFit.fill,
                                              width: 100,
                                              height: 100,
                                            ),
                                          )),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.transparent,

                                      width: double.infinity,
                                      //color: Colors.blue,
                                      child: Center(
                                        child: Text(
                                            ((locations[index].distance) /
                                                        1609.344)
                                                    .toStringAsFixed(2) +
                                                " mi"),
                                      ),
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
                              color: Colors.transparent,
                              height: double.infinity,
                              child: Card(
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        //dense: true,
                                        visualDensity: VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical: -4),
                                        //leading: Icon(Icons.abc),
                                        //contentPadding:EdgeInsets.all(0),
                                        //horizontalTitleGap: 0,
                                        // minVerticalPadding: 0,

                                        title: Text(locations[index].name,
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                            overflow: TextOverflow.fade),
                                        subtitle: Text(locations[index].address,
                                            textAlign: TextAlign.center),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,

                                        children: [
                                          IconButton(
                                            onPressed: () async => {
                                              showDirectionWithFirstMap(
                                                  locations[index])
                                            },
                                            icon: Icon(Icons.directions),
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              // launchUrl(Uri(
                                              //   path: "+99364921507",
                                              //     scheme: "tel"));
                                            },
                                            icon: Icon(Icons.phone),
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),

                                          //ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.phone), label: Text("button 1"),style: ,)

                                          // Icon(Icons.medication),
                                          // Icon(Icons.wine_bar),
                                          // Icon(Icons.soup_kitchen),
                                          // Icon(Icons.headphones),
                                        ],
                                      )
                                    ],
                                  )),
                            )),
                      ],
                    ),
                  );
                }),
              );
          },
        )));
  }
}

// String parse_address_aapl(Location o) {
//   print(o.address + o.city);
//   String street_address = o.address;
//   String city_state_zip = o.city;
//   street_address = street_address.replaceAll(" ", "+");
//   city_state_zip = city_state_zip.replaceAll(" ", "+");
//   print(street_address + "," + city_state_zip);
//   return street_address;
// }

// todo set up geolocator ->> get yelp api to work with geo locator ->> then get maps to open with info ->> re factor code to allow for reusabliity for the other instacnes

Future<Position> _getCurrentLocation() async {
  Position position = await _determinePosition();
  _position = position;
  return position;
}

Future<Position> _determinePosition() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
// When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  print("Before return");

  return await Geolocator.getCurrentPosition();
}

showDirectionWithFirstMap(Location location) async {
  print("after return");
  final availableMaps = await MapLauncher.installedMaps;
  await availableMaps[0].showDirections(
      destination: Coords(location.latitude, location.longitude),
      destinationTitle: location.name);
}
