import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:alot_mobiledevelopment/screens/home/barber_home.dart';
import 'package:alot_mobiledevelopment/controllers/map_controller.dart'
    as map_ctrl;
import 'package:permission_handler/permission_handler.dart';

class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  final map_ctrl.MapController _mapController = map_ctrl.MapController();
  bool useCurrentLocation = false;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted, proceed with location-related functionality
    } else if (status.isDenied) {
      // Permission denied, show a message to the user
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is your location?'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search your location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: useCurrentLocation,
              onChanged: (value) {
                setState(() {
                  useCurrentLocation = value ?? false;
                });
              },
              title: const Text("Use my current location"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: GoogleMap(
                  onMapCreated: _mapController.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _mapController.center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to confirm location and proceed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const BarberHomeScreen(), // Change based on role
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Confirm Location'),
            ),
          ],
        ),
      ),
    );
  }
}
