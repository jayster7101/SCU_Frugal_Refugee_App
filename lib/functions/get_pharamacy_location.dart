import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:starter/mockData.dart';
import 'dart:convert';

List<Location> locations = [];
String open = "";
var good;
String token =
    'Bearer jZAGqOHFkvs8cEDhywZRDtAp6C6v7TH9UUg3vO6cFyIc8WC57NU01rlTdXTGnBxxQHBEjfwKlAvjh5LrUsII9qs-4CjW3Ke3lOO9VoPKGJlgLqedp_0Q-S_qyBfGYnYx';

// creates a future function called get_pharma_location()
// Params is the location of where the person is as
// can be used with geo location just need to get that long and lat
Future get_pharma_location(Position? _position, String location) async {
  locations.length = 0;
  var headers = {'Authorization': token};
  // http request with url and location as a param
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.yelp.com/v3/businesses/search?latitude=${_position?.latitude}&longitude=${_position?.longitude}&term=$location&limit=10'));

  request.headers.addAll(
      headers); // adds the headers to the http request in this cause only auth

  http.StreamedResponse response = await request
      .send(); //  creates a StreamedResponse out of a the request after being sent

  if (response.statusCode == 200) {
    // await the response stream and convert to string stored in "param"
    await response.stream.bytesToString().then((param) => {
          // decode data to json
          good = json.decode(param),
          // loop through and create based on number of item in the response ********* NOT WORKING NEEDS TO BE FIXED SO THAT FOR LOOP LENGTH IS NOT HARD CODED*********
          for (int i = 0; i < 10; i++)
            {
              // adds location object to list of locations
              locations.add(Location(
                good["businesses"][i]["name"],
                good["businesses"][i]["location"]["address1"] +
                    " " +
                    good["businesses"][i]["location"]["city"] +
                    ", " +
                    good["businesses"][i]["location"]["state"] +
                    " " +
                    good["businesses"][i]["location"]["zip_code"],
                good["businesses"][i]["distance"],
                good["businesses"][i]["image_url"],
                good["businesses"][i]["coordinates"]["latitude"],
                good["businesses"][i]["coordinates"]["longitude"],
              )),
            }
        });
  }

  locations.sort((a, b) => a.distance.compareTo(b.distance));
  return locations;
}
