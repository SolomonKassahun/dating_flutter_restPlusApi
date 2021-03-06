import 'dart:js';

import 'package:dating_app/user/screens/home.dart';
import 'package:dating_app/user/screens/page1.dart';
import 'package:dating_app/user/screens/user_login.dart';
import 'package:dating_app/user/screens/user_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatingAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => PageOne());
    }
    if (settings.name == RegisterPage.routeName) {
      return MaterialPageRoute(builder: (context) => RegisterPage());
    }
    if (settings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: (context) => HomePage());
    }
    if (settings.name == UserLogin.routeName) {
      return MaterialPageRoute(builder: (context) => UserLogin());
    }
    return MaterialPageRoute(builder: (context) => PageOne());
  }
}
