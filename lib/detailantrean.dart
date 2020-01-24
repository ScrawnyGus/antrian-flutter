import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DetailAntrean extends StatefulWidget {
  DetailAntrean({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DetailAntreanState createState() => _DetailAntreanState();
}

class _DetailAntreanState extends State<DetailAntrean> {
  _showDialog() {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text('Antrean Terambil'),
        content: Text('Antrean Anda nomor 1'),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'STMIK STIKOM Indonesia',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Perpustakaan',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              FlutterLogo(
                size: 100,
              ),
              Text('Antrean Saat Ini'),
              Text('10/100'),
              PlatformButton(
                onPressed: () => _showDialog(),
                child: PlatformText('Ambil Antrean'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _androidPopupContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: PlatformText('Option 1'),
            ),
            onTap: () => Navigator.pop(context),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: PlatformText('Option 2'),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _cupertinoSheetContent() {
    return CupertinoActionSheet(
      title: const Text('Favorite Dessert'),
      message:
          const Text('Please select the best dessert from the options below.'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Profiteroles'),
          onPressed: () {
            Navigator.pop(context, 'Profiteroles');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Cannolis'),
          onPressed: () {
            Navigator.pop(context, 'Cannolis');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Trifle'),
          onPressed: () {
            Navigator.pop(context, 'Trifle');
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
      ),
    );
  }
}
