import 'package:antrian/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Profil"),
      ),
      body: Center(
        child: PlatformButton(
          onPressed: logout,
          child: Text('Logout'),
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.remove('uid');
    // localStorage.remove('token');
    // localStorage.setBool('isLoggedIn', false);
    localStorage.clear();

    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }
}
