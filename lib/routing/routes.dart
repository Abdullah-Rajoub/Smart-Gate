import 'package:flutter/material.dart';
import 'package:smart_gate/ui/screens/access_log_screen.dart';
import 'package:smart_gate/ui/screens/expanded_image_screen.dart';
import 'package:smart_gate/ui/screens/login_screen.dart';
import 'package:smart_gate/ui/screens/profile_screen.dart';

//File that contains all the named routes.
var currentRoute = <String, WidgetBuilder>{
  LoginScreen.id: (context) => LoginScreen(),
  ProfileScreen.id: (context) => ProfileScreen(),
  AccessLogScreen.id: (context) => AccessLogScreen(),
  ExpandedImageScreen.id: (context) => ExpandedImageScreen(),
};
