// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alot_mobiledevelopment/screens/auth/signin_screen.dart' as _i9;
import 'package:alot_mobiledevelopment/screens/auth/signup_screen.dart' as _i10;
import 'package:alot_mobiledevelopment/screens/booking/booking_screen.dart'
    as _i2;
import 'package:alot_mobiledevelopment/screens/chat/chat_screen.dart' as _i3;
import 'package:alot_mobiledevelopment/screens/home/barber_home.dart' as _i1;
import 'package:alot_mobiledevelopment/screens/home/client_home.dart' as _i4;
import 'package:alot_mobiledevelopment/screens/location/enter_location_screen.dart'
    as _i6;
import 'package:alot_mobiledevelopment/screens/location/location_access_screen.dart'
    as _i7;
import 'package:alot_mobiledevelopment/screens/map/map_screen.dart' as _i8;
import 'package:alot_mobiledevelopment/screens/profile/complete_profile_screen.dart'
    as _i5;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:firebase_auth/firebase_auth.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.BarberHomeScreen]
class BarberHomeRoute extends _i11.PageRouteInfo<void> {
  const BarberHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          BarberHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarberHomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.BarberHomeScreen();
    },
  );
}

/// generated route for
/// [_i2.BookingScreen]
class BookingRoute extends _i11.PageRouteInfo<void> {
  const BookingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookingScreen();
    },
  );
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i11.PageRouteInfo<void> {
  const ChatRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChatScreen();
    },
  );
}

/// generated route for
/// [_i4.ClientHomeScreen]
class ClientHomeRoute extends _i11.PageRouteInfo<void> {
  const ClientHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ClientHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientHomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.ClientHomeScreen();
    },
  );
}

/// generated route for
/// [_i5.CompleteProfileScreen]
class CompleteProfileRoute
    extends _i11.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i12.Key? key,
    required _i13.User user,
    required String initialName,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CompleteProfileRoute.name,
          args: CompleteProfileRouteArgs(
            key: key,
            user: user,
            initialName: initialName,
          ),
          initialChildren: children,
        );

  static const String name = 'CompleteProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompleteProfileRouteArgs>();
      return _i5.CompleteProfileScreen(
        key: args.key,
        user: args.user,
        initialName: args.initialName,
      );
    },
  );
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({
    this.key,
    required this.user,
    required this.initialName,
  });

  final _i12.Key? key;

  final _i13.User user;

  final String initialName;

  @override
  String toString() {
    return 'CompleteProfileRouteArgs{key: $key, user: $user, initialName: $initialName}';
  }
}

/// generated route for
/// [_i6.EnterLocationScreen]
class EnterLocationRoute extends _i11.PageRouteInfo<void> {
  const EnterLocationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EnterLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterLocationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.EnterLocationScreen();
    },
  );
}

/// generated route for
/// [_i7.LocationAccessScreen]
class LocationAccessRoute extends _i11.PageRouteInfo<LocationAccessRouteArgs> {
  LocationAccessRoute({
    _i12.Key? key,
    required String role,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LocationAccessRoute.name,
          args: LocationAccessRouteArgs(
            key: key,
            role: role,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationAccessRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationAccessRouteArgs>();
      return _i7.LocationAccessScreen(
        key: args.key,
        role: args.role,
      );
    },
  );
}

class LocationAccessRouteArgs {
  const LocationAccessRouteArgs({
    this.key,
    required this.role,
  });

  final _i12.Key? key;

  final String role;

  @override
  String toString() {
    return 'LocationAccessRouteArgs{key: $key, role: $role}';
  }
}

/// generated route for
/// [_i8.MapScreen]
class MapRoute extends _i11.PageRouteInfo<void> {
  const MapRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.MapScreen();
    },
  );
}

/// generated route for
/// [_i9.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SignInScreen();
    },
  );
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SignUpScreen();
    },
  );
}
