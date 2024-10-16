import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/center/controller/center_controller.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

void AddBranches(BuildContext context) {
  final CenterController controller = Get.put(CenterController());
  controller.activelocation.value =
      LatLng(14.389570696570049, 121.04468471073422);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 890,
          height: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 12),
                  child: Text(
                    'Add Center',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 430,
                  height: 350,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Name',
                              style: TextStyles.Text,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 385,
                                height: 35,
                                child: CupertinoTextField(
                                  controller: controller.NameC,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Location',
                              style: TextStyles.Text,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 385,
                                height: 110,
                                child: CupertinoTextField(
                                  controller: controller.LocationC,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Latitude',
                              style: TextStyles.Text,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 385,
                                height: 35,
                                child: CupertinoTextField(
                                  controller: controller.latitudeC,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Longitude',
                              style: TextStyles.Text,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 385,
                                height: 35,
                                child: CupertinoTextField(
                                  controller: controller.longitudeC,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                //Map
                //Map
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: 430,
                    height: 350,
                    child: Stack(
                      children: [
                        Obx(() => FlutterMap(
                              options: MapOptions(
                                initialCenter: controller.activelocation.value,
                                onTap: (tapPosition, point) async {
                                  // When the map is tapped, set the clicked location in the controller
                                  controller.clickedLocation.value = point;

                                  print(
                                      'Map tapped at Latitude: ${point.latitude}, Longitude: ${point.longitude}');
                                  controller.longitudeC.text =
                                      point.longitude.toString();
                                  controller.latitudeC.text =
                                      point.latitude.toString();

                                  try {
                                    // Perform reverse geocoding
                                    List<Placemark> placemarks =
                                        await placemarkFromCoordinates(
                                      point.latitude,
                                      point.longitude,
                                    );

                                    // Check if placemarks is not empty before accessing it
                                    if (placemarks.isNotEmpty &&
                                        placemarks.first != null) {
                                      Placemark place = placemarks.first;
                                      String address =
                                          "${place.street ?? ''}, ${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.country ?? ''}";

                                      print('Location Address: $address');

                                      // Optional: update controller with the address if you want to display it somewhere
                                      controller.LocationC.text = address;
                                    } else {
                                      print(
                                          'No address found for this location.');
                                    }
                                  } catch (e) {
                                    print('Error in reverse geocoding: $e');
                                  }
                                },
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                MarkerLayer(
                                  markers: [
                                    // Display existing center markers
                                    ...controller.center.map((center) {
                                      return Marker(
                                        point: LatLng(
                                            center.latitude, center.longitude),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                'Marker at Latitude: ${center.latitude}, Longitude: ${center.longitude}');
                                          },
                                          child: Icon(
                                            Icons.location_pin,
                                            color: Colors.blue,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                    // Add marker at the clicked location, if available
                                    if (controller.clickedLocation.value !=
                                        null)
                                      Marker(
                                        point:
                                            controller.clickedLocation.value!,
                                        child: Icon(
                                          Icons.location_pin,
                                          color: Colors
                                              .red, // Different color for clicked location
                                          size: 30.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ]),
              SizedBox(height: 10),
              Divider(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("Save"),
                      onPressed: () {
                        controller.addcenter(context);
                        // showSuccessToast(context, title: 'Success!', text: 'Your request has been successfully submitted.');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
