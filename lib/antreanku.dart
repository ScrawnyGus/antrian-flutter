import 'package:flutter/material.dart';

import 'package:antrian/detailantrean.dart';

class Antreanku extends StatefulWidget {
  @override
  _AntreankuState createState() => _AntreankuState();
}

class _AntreankuState extends State<Antreanku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Antreanku"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only (left: 20, top: 20),
            child: Text('Masih nunggu ...',
            style: TextStyle(fontSize: 20),),
          ),
          Material(
            child: Column(
              children: <Widget>[
                ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: FlutterLogo(size: 50.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    trailing: Text('01', style: TextStyle(fontSize: 50),),
                    // enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),

                    ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: FlutterLogo(size: 50.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    trailing: Text('01', style: TextStyle(fontSize: 50),),
                    // enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),

                    ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: FlutterLogo(size: 50.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    trailing: Text('01', style: TextStyle(fontSize: 50),),
                    // enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
