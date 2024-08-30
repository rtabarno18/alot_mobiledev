import 'package:alot_mobiledevelopment/config/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandler;
import 'package:geolocator/geolocator.dart';

@RoutePage()
class LocationAccessScreen extends StatelessWidget {
  final String role;

  const LocationAccessScreen({super.key, required this.role});

  Future<void> _requestLocationPermission(BuildContext context) async {
    var status = await permissionHandler.Permission.location.request();
    if (status.isGranted) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          permissionHandler.openAppSettings();
          return;
        }
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Location permission is required to proceed.'),
              action: SnackBarAction(
                label: 'Settings',
                onPressed: () {
                  permissionHandler.openAppSettings();
                },
              ),
            ),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Location permission is permanently denied. Please enable it in settings.'),
            action: SnackBarAction(
              label: 'Settings',
              onPressed: () {
                permissionHandler.openAppSettings();
              },
            ),
          ),
        );
        return;
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Navigate to the appropriate home screen based on the role
      if (role == 'client') {
        context.router.replaceAll([const ClientHomeRoute()]);
      } else if (role == 'barber') {
        context.router.replaceAll([const BarberHomeRoute()]);
      }
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Location permission is required to proceed.'),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: () {
              permissionHandler.openAppSettings();
            },
          ),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Location permission is permanently denied. Please enable it in settings.'),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: () {
              permissionHandler.openAppSettings();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Access"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What is your location?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("We need to know your location to find nearby services"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _requestLocationPermission(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
              ),
              child: const Text('Allow Location Access'),
            ),
          ],
        ),
      ),
    );
  }
}
