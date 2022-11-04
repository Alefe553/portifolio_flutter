import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const mainURL = 'https://api.github.com/users/Alefe553';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
