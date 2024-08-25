import 'package:alot_mobiledevelopment/screens/home/barber_home.dart';
import 'package:alot_mobiledevelopment/screens/home/client_home.dart';
import 'package:alot_mobiledevelopment/screens/location/location_access_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/auth/signin_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/profile/complete_profile_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => SignInScreen(),
      '/signup': (context) => SignUpScreen(),
      '/signin': (context) => SignInScreen(),
      '/completeProfile': (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final user = args['user'] as User;
        final initialName = args['initialName'] as String;
        return CompleteProfileScreen(user: user, initialName: initialName);
      },
      '/locationAccess': (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        final role = args['role'] as String;
        return LocationAccessScreen(role: role);
      },
      '/barberHome': (context) => const BarberHomeScreen(),
      '/clientHome': (context) => const ClientHomeScreen(),
    };
  }
}
