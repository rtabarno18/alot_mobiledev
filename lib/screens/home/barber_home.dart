import 'package:flutter/material.dart';

class BarberHomeScreen extends StatelessWidget {
  const BarberHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Barber Home Screen'),
      ),
    );
  }
}
