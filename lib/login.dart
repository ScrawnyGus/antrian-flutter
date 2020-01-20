import 'dart:convert';

import 'package:antrian/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'antreanku.dart';
import 'profil.dart';

const URL = "https://flutter.io/";

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ScaffoldState scaffoldState;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.grey),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextField(
      obscureText: true,
      controller: passwordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.grey),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: _isLoading ? null : _login,
        child: Text(
          _isLoading ? 'Logging in...' : "Login",
          textAlign: TextAlign.center,
        ),
        disabledColor: Colors.grey,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: FlutterLogo(
                    size: 155,
                  ),
                ),
                SizedBox(height: 45),
                emailField,
                SizedBox(height: 25),
                passwordField,
                SizedBox(height: 35),
                loginButton,
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/RegisterScreen');
                  },
                  child: Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']['token']);
      localStorage.setBool('isLoggedIn', true);

      String token = body['token']['token'];
      final parts = token.split('.');
      final payload = parts[1];
      final decoded = json.decode(B64urlEncRfc7515.decodeUtf8(payload));
      localStorage.setInt('uid', decoded['uid']);

      print(decoded['uid']);
      print(body['token']['token']);
      Navigator.pushReplacementNamed(context, '/HomeScreen');
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}

class LoggedIn extends StatefulWidget {
  LoggedIn({Key key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomeScreen(),
    Antreanku(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: _pageOptions[_selectedPage],
      bottomNavBar: PlatformNavBar(
        currentIndex: _selectedPage,
        itemChanged: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: PlatformIconButton(
                iosIcon: Icon(
                  CupertinoIcons.home,
                  size: 28.0,
                ),
                androidIcon: Icon(Icons.home)),
            activeIcon: PlatformIconButton(
                iosIcon: Icon(
                  CupertinoIcons.home,
                  size: 28.0,
                  color: Colors.purple,
                ),
                androidIcon: Icon(
                  Icons.home,
                  color: Colors.purple,
                )),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: PlatformIconButton(
                iosIcon: Icon(
                  Icons.list,
                  size: 28.0,
                ),
                androidIcon: Icon(Icons.list)),
            activeIcon: PlatformIconButton(
                iosIcon: Icon(
                  Icons.list,
                  size: 28.0,
                  color: Colors.purple,
                ),
                androidIcon: Icon(
                  Icons.list,
                  color: Colors.purple,
                )),
            title: Text('Antreanku'),
          ),
          BottomNavigationBarItem(
            icon: PlatformIconButton(
                iosIcon: Icon(
                  CupertinoIcons.person,
                  size: 28.0,
                ),
                androidIcon: Icon(Icons.person)),
            activeIcon: PlatformIconButton(
                iosIcon: Icon(
                  CupertinoIcons.person,
                  size: 28.0,
                  color: Colors.purple,
                ),
                androidIcon: Icon(
                  Icons.person,
                  color: Colors.purple,
                )),
            title: Text('Profil'),
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.home), title: Text('Beranda')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.list), title: Text('Antreanku')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person), title: Text('Profil')),
        ],
      ),
    );
  }
}
