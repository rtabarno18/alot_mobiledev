import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../location/location_access_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  final User user;

  const CompleteProfileScreen({super.key, required this.user});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _selectedRole; // Add this line

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                backgroundImage:
                    _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null
                    ? const Icon(Icons.camera_alt,
                        color: Colors.white, size: 30)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile<String>(
              title: const Text('Client'),
              value: 'client',
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Barber'),
              value: 'barber',
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_selectedRole == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a role')),
                  );
                  return;
                }
                // Save profile data to Firestore
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationAccessScreen(),
                  ),
                );
              },
              child: const Text('Complete Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
