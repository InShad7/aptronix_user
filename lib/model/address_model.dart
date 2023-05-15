import 'package:aaptronix/controller/controller.dart';


class Address {
  String name;
  String phoneNumber;
  String pincode;
  String city;
  String state;
  String houseNumber;
  String streetName;

  Address({
    required this.name,
    required this.phoneNumber,
    required this.pincode,
    required this.city,
    required this.state,
    required this.houseNumber,
    required this.streetName,
  });

  Future<void> addAdress() async {
    Map<String, dynamic> saveWish() {
      return {
        'name': name,
        'phoneNumber': phoneNumber,
        'pincode': pincode,
        'city': city,
        'state': state,
        'houseNumber': houseNumber,
        'streetName': streetName,
      };
    }

    addressList.add(saveWish());
  }
}
