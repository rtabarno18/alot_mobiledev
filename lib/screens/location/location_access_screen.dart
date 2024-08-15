import 'package:alot_mobiledevelopment/screens/location/enter_location_screen.dart';
import 'package:flutter/material.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

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
            const Text("What is your location?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("We need to know your location to find nearby services"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnterLocationScreen(),
                  ),
                );
              },
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
