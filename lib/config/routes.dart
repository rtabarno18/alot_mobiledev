import 'package:alot_mobiledevelopment/screens/home/barber_home.dart';
import 'package:alot_mobiledevelopment/screens/home/client_home.dart';
import 'package:alot_mobiledevelopment/screens/location/enter_location_screen.dart';
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
        final user = ModalRoute.of(context)!.settings.arguments as User;
        return CompleteProfileScreen(user: user);
      },
      '/locationAccess': (context) => const LocationAccessScreen(),
      '/enterLocation': (context) => const EnterLocationScreen(),
      '/barberHome': (context) => const BarberHomeScreen(),
      '/clientHome': (context) => const ClientHomeScreen(),
    };
  }
}
