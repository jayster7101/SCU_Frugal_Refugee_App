// needs to add city state etc and hours of opperation

class Location {
  Location(String _name, String _address, double _distance, String _image,
      double _latitude, double _longitude, String _phone) {
    name = _name;
    address = _address;
    distance = _distance;
    image = _image;
    latitude = _latitude;
    longitude = _longitude;
    phone = _phone;
  }

  String name = "";
  String hours = "";
  String address = "";
  double distance = 0;
  String image = "https://picsum.photos/250?image=9";
  double latitude = 0;
  double longitude = 0;
  late String phone;
  // late String state;
  // int number_of_doors = 0;
  // List<String> possible_upgrades = [
  //   "Boost",
  //   "Turbo Charger",
  //   "Air intake",
  //   "Headers"
  // ];
  // // simple constructor Car(this.name, this.number_of_doors, this.possible_upgrades);

  // String name_of_car() {
  //   return name;
  // }

  // void set_name_of_car(String _name) {
  //   _name = name;
  // }

  // List<String> get_name_of_car() {
  //   return possible_upgrades;
  // }
}
