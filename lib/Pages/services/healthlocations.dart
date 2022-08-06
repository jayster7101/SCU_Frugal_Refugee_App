import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:starter/Pages/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starter/Pages/services/getpharamacylocation.dart';
import 'package:url_launcher/url_launcher.dart';

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
    _getCurrentLocation()
        .then((currentP) => get_pharma_location(currentP, widget.place));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.place),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        body: FutureBuilder(
          future: _getCurrentLocation().then(
        (currentP) => get_pharma_location(currentP, widget.place),
          ),
          builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 209, 209),
                    borderRadius: BorderRadius.all(Radius.circular(12))),

                height: 100,
                width: 414,
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
                                  padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                                  child: Center(
                                      heightFactor: 100,
                                      widthFactor: 100,
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
                                        "${((locations[index].distance) /
                                                    1609.344)
                                                .toStringAsFixed(2)} mi"),
                                  ),
                                )),
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
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
                                    visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: -4),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,

                                    children: [
                                      IconButton(
                                        onPressed: () async => {
                                          showDirectionWithFirstMap(
                                              locations[index])
                                        },
                                        icon: const Icon(Icons.directions),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          if (locations[index]
                                              .phone
                                              .isNotEmpty) {
                                            await _makePhoneCall(
                                                locations[index].phone);
                                          }
                                        },
                                        icon: const Icon(Icons.phone),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
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
        }
          },
        ));
  }
}
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
  return await Geolocator.getCurrentPosition();
}

showDirectionWithFirstMap(Location location) async {
  final availableMaps = await MapLauncher.installedMaps;
  await availableMaps[0].showDirections(
      destination: Coords(location.latitude, location.longitude),
      destinationTitle: location.name);
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
