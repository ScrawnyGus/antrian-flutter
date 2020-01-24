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
      body: Container(
        height: 600,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/logo.png',
                        width: 100.0, height: 100.0, fit: BoxFit.fitHeight),
                  ],
                ),
              ),
              Container(
                height: 120.0,
                child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: Text(
                          'Namamu',
                          // style: heading2(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        'emailmu@mail.com',
                        // style: normalstyle(),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '+62 123 456 789',
                        // style: miringstyle(),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Alamatmu',
                        // style: miringstyle(),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: PlatformButton(
                        onPressed: logout,
                        child: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
