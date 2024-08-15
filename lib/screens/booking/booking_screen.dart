import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Column(
        children: [
          ListTile(
            title: const Text('Haircut'),
            trailing: ElevatedButton(
              onPressed: () {
                // Book the appointment
              },
              child: const Text('Book'),
            ),
          ),
          ListTile(
            title: const Text('Shave'),
            trailing: ElevatedButton(
              onPressed: () {
                // Book the appointment
              },
              child: const Text('Book'),
            ),
          ),
        ],
      ),
    );
  }
}
