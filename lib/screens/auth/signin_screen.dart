import 'package:alot_mobiledevelopment/screens/home/barber_home.dart';
import 'package:alot_mobiledevelopment/screens/home/client_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'johndoe@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '************',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 100.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        User? user = await _authController.signInWithEmail(
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (user != null) {
                          // Navigate to the appropriate home screen based on role
                          String role =
                              await _authController.getUserRole(user.uid);
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
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
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
                    child: const Text(
                      "Don't have an account? SignUp",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle password recovery
                    },
                    child: const Text(
                      'Forgot your Password?',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or Login using"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'assets/icons/twitter.svg'), // Use SvgPicture.asset
                            iconSize: 40,
                            onPressed: () {
                              // Handle Twitter login
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'assets/icons/google.svg'), // Use SvgPicture.asset
                            iconSize: 40,
                            onPressed: () {
                              // Handle Google login
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'assets/icons/facebook.svg'), // Use SvgPicture.asset
                            iconSize: 40,
                            onPressed: () {
                              // Handle Facebook login
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
