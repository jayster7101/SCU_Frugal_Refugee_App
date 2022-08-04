// needs to add city state etc and hours of opperation
class Location {
  Location(String name, String address, double distance, String image,
      double latitude, double longitude, String phone) {
    name = name;
    address = address;
    distance = distance;
    image = image;
    latitude = latitude;
    longitude = longitude;
    phone = phone;
  }

  String name = "";
  String hours = "";
  String address = "";
  double distance = 0;
  String image = "https://picsum.photos/250?image=9";
  double latitude = 0;
  double longitude = 0;
  late String phone;
}
