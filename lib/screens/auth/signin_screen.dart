import 'package:alot_mobiledevelopment/screens/home/barber_home.dart';
import 'package:alot_mobiledevelopment/screens/home/client_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../controllers/auth_controller.dart'; // Import the AuthController
import 'signup_screen.dart'; // Import the SignUpScreen

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = AuthController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'johndoe@gmail.com',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '************',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              onPressed: () async {
                try {
                  User? user = await _authController.signInWithEmail(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (user != null) {
                    // Navigate to the appropriate home screen based on role
                    String role = await _authController.getUserRole(user.uid);
                    if (role == 'barber') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BarberHomeScreen(),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClientHomeScreen(),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign in error: $e')),
                  );
                }
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
