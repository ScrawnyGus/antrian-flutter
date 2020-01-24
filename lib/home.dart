import 'package:antrian/detailantrean.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'random_words.dart';
import 'package:flutter/material.dart';

import 'package:antrian/login.dart';

List<String> kategori = [
  'PRODI',
  'BAAK',
  'FO',
  'PERPUSTAKAAN',
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sideLength = 50;
  int _act = 1;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text("Saku Antri"),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Antrean Populer',
                style: TextStyle(fontSize: 20),
              )),
          Material(
            child: Column(
              children: <Widget>[
                ListTile(
                    contentPadding: EdgeInsets.only(left: 20),
                    leading: FlutterLogo(size: 56.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),
                ListTile(
                    contentPadding: EdgeInsets.only(left: 20),
                    leading: FlutterLogo(size: 56.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),
                ListTile(
                    contentPadding: EdgeInsets.only(left: 20),
                    leading: FlutterLogo(size: 56.0),
                    title: const Text('STMIK STIKOM Indonesia'),
                    subtitle: Text('Perpustakaan'),
                    enabled: _act == 1,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailAntrean(title: 'STMIK STIKOM Indonesia')));
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Antrean Lainnya',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Material(
            child: Column(
              children: <Widget>[
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: kategori.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: 100,
                              child: Card(
                                elevation: 1,
                                child: GestureDetector(
                                  // onTap: () {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               IsiKategoriKepolisian(title: 'Kepolisian',)));
                                  // },
                                  // child: Icon(Icons.account_box),
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      // height: 5,
                                      // width: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(kategori[i])
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
          // child: ListView(
          //   padding: const EdgeInsets.all(8),
          //   children: <Widget>[
          //     Container(
          //       height: 50,
          //       child: Container(
          //           padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          //           child: Text(
          //             'Daftar Antrean',
          //             style: TextStyle(fontSize: 18),
          //           )),
          //     ),
          //     Container(
          //       // child: ListTile(
          //       //   title: Text('STMIK STIKOM Indonesia'),
          //       //   subtitle: Text('Pengumpulan Berkas TA'),
          //       //   onTap: () {
          //       //     Navigator.of(context).push(
          //       //         MaterialPageRoute(builder: (context) => RandomWords()));
          //       //   },
          //       // ),
          //       child: Container(
          //         child: Material(
          //           elevation: 1,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: new BorderRadius.circular(10)),
          //           child: InkWell(
          //             child: Row(
          //               children: <Widget>[
          //                 // Image.network(
          //                 //   'https://media.neliti.com/media/organisations/logo-None-stiki-indonesia-3235790d.png',
          //                 //   height: 100,
          //                 // ),
          //                 Column(
          //                   children: <Widget>[
          //                     Container(
          //                         width:
          //                             MediaQuery.of(context).size.width * 0.7,
          //                         child: Column(
          //                           children: <Widget>[
          //                             Text(
          //                               "STMIK STIKOM Indonesia",
          //                               textAlign: TextAlign.left,
          //                               style: TextStyle(
          //                                 fontSize: 20,
          //                               ),
          //                             ),
          //                             Text(
          //                               "Pengumpulan Berkas TA",
          //                               textAlign: TextAlign.left,
          //                               style: TextStyle(color: Colors.grey),
          //                             ),
          //                           ],
          //                         )),
          //                   ],
          //                 )
          //               ],
          //             ),
          //             onTap: () {
          //               Navigator.of(context).push(
          //                   MaterialPageRoute(builder: (context) => Login()));
          //             },
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ])));
  }
}
