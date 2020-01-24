import 'package:antrian/register.dart';
import 'package:antrian/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'login.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    final themeData = new ThemeData(
      primarySwatch: Colors.blue,
    );

    final cupertinoTheme = new CupertinoThemeData(
      primaryColor: Colors.blue,
    );
    final cupertinoDarkTheme = new CupertinoThemeData(
      primaryColor: Colors.blue,
      brightness: Brightness.dark,
    );

    // Example of optionally setting the platform upfront.
    //final initialPlatform = TargetPlatform.iOS;

    // If you mix material and cupertino widgets together then you cam
    // set this setting. Will mean ios darmk mode to not to work properly
    //final settings = PlatformSettingsData(iosUsesMaterialWidgets: true);

    return PlatformProvider(
      builder: (context) => PlatformApp(
        title: 'Flutter Platform Widgets',
        android: (_) {
          return MaterialAppData(
            routes: <String, WidgetBuilder>{
              "/HomeScreen": (BuildContext context) => LoggedIn(),
              "/LoginScreen": (BuildContext context) => LoginScreen(),
              "/RegisterScreen": (BuildContext context) => RegisterScreen(),
            },
            // onUnknownRoute: (RouteSettings setting) {
            //   // To can ask the RouterSettings for unknown router name.
            //   String unknownRoute = setting.name ;
            //   return new MaterialPageRoute(
            //               builder: (context) => Login()
            //   );
            // },
            theme: themeData,
            darkTheme: themeData.copyWith(
              brightness: Brightness.dark,
            ),
            themeMode: brightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
        ios: (_) => new CupertinoAppData(
          theme: brightness == Brightness.light
              ? cupertinoTheme
              : cupertinoDarkTheme,
        ),
        home: SplashScreen(),
        // home: Login(title: 'SakuAntri'),
      ),
      // ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       theme: ThemeData(primaryColor: Colors.purple[900]),
  //       home: Login(title: 'SakuAntri'));
  // }
}
