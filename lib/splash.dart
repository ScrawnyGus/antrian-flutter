import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 1;

  countDownTime() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(localStorage.getString('token') ?? null);
    print(localStorage.getString('uid') ?? null);
    print(localStorage.getString('isLoggedIn') ?? null);
    var isLoggedIn = localStorage.getBool('isLoggedIn') ?? false;
    Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
      } else {
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }
}
