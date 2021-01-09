import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in_demo/home_screen.dart';
import 'package:flutter_google_sign_in_demo/login_screen.dart';
import 'package:flutter_google_sign_in_demo/splash.dart';
import 'package:flutter_google_sign_in_demo/utils/routeNames.dart';
import 'package:flutter_google_sign_in_demo/sign_up.dart';
import 'package:flutter_google_sign_in_demo/test.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Splash());
      case RouteName.USER_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.SignUp:
        return MaterialPageRoute(builder: (_) => Signup());
      case RouteName.Test:
        return MaterialPageRoute(builder: (_) => Test());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Image.asset('assets/images/error.jpg'),
                  Text(
                    "${settings.name} does not exists!",
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            ),
          ),
        );
    }
  }
}
