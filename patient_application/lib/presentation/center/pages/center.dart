import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:patient_application/presentation/center/controllers/center_controllers.dart';
import 'package:patient_application/presentation/center/pages/center_view.dart';

class Centers extends StatelessWidget {
  final CenterControllers controller = Get.put(CenterControllers());
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    // Set initial location
    controller.activelocation.value =
        LatLng(14.389570696570049, 121.04468471073422);

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: controller.activelocation.value,
                onTap: (point, location) {
                  print('map tapped');
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: controller.center.map(
                    (center) {
                      return Marker(
                          point: LatLng(center.latitude, center.longitude),
                          child: GestureDetector(
                            onTap: () {
                              print({center.latitude, center.longitude});
                              ViewCenter(
                                  context, center.branch_name, center.address);
                            },
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ));
                    },
                  ).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.move(controller.activelocation.value, 13.0);
        },
        child: Icon(Icons.location_searching),
      ),
    );
  }
}
