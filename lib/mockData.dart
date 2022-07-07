//class for a car
class car {
  Car(String name) {}
  String name = "";
  int number_of_doors = 0;
  List<String> possible_upgrades = [
    "Boost",
    "Turbo Charger",
    "Air intake",
    "Headers"
  ];
  // simple constructor Car(this.name, this.number_of_doors, this.possible_upgrades);

  String name_of_car() {
    return name;
  }

  void set_name_of_car(String _name) {
    _name = name;
  }

  List<String> get_name_of_car() {
    return possible_upgrades;
  }
}
