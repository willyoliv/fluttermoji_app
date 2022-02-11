import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermoji_assets/fluttermojimodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttermoji Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Fluttermoji'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _controller;

  @override
  void initState() {
    _controller = FluttermojiFunctions();
  }

  // Future<Map<String, dynamic>> encodeMySVGtoMap() async {
  //   print("Aqui");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? _fluttermojiOptions = pref.getString('fluttermojiSelectedOptions');
  //   if (_fluttermojiOptions == null || _fluttermojiOptions == '') {
  //     Map<String, int> _fluttermojiOptionsMap =
  //         Map.from(defaultFluttermojiOptions);
  //     await pref.setString(
  //         'fluttermojiSelectedOptions', jsonEncode(_fluttermojiOptionsMap));

  //     return _fluttermojiOptionsMap;
  //   }

  //   return Map.from(jsonDecode(_fluttermojiOptions));
  // }

  // Future<String> encodeMySVGtoString() async {
  //   print("Aqui 2");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? _fluttermojiOptions = pref.getString('fluttermojiSelectedOptions');
  //   if (_fluttermojiOptions == null || _fluttermojiOptions == '') {
  //     Map<String, int> _fluttermojiOptionsMap =
  //         Map.from(defaultFluttermojiOptions);
  //     await pref.setString(
  //         'fluttermojiSelectedOptions', jsonEncode(_fluttermojiOptionsMap));
  //     return jsonEncode(_fluttermojiOptionsMap);
  //   }
  //   return _fluttermojiOptions;
  // }

  Future<void> blabla() async {
    print("Aqui");
    print(await _controller.encodeMySVGtoString());
    // await _controller.clearFluttermoji();
  }

  @override
  Widget build(BuildContext context) {
    blabla();
    TargetPlatform platform = Theme.of(context).platform;
    var isWeb = platform != TargetPlatform.android &&
        platform != TargetPlatform.iOS &&
        platform != TargetPlatform.macOS &&
        platform != TargetPlatform.windows &&
        platform != TargetPlatform.fuchsia;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Use your Fluttermoji anywhere\nwith the below widget",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FluttermojiCircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 100,
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "and create your own page to customize them using our widgets",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: Container(
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Customize"),
                    onPressed: () => Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => NewPage())),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          (isWeb)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      size: 50,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Web preview is unstable at the moment\n",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              "This demo may not work on your mobile browser,\nUse your Desktop browser or install the app."),
                        ],
                      ),
                    )
                  ],
                )
              : SizedBox(height: 0),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    var isWeb = platform != TargetPlatform.android ||
        platform != TargetPlatform.iOS ||
        platform != TargetPlatform.fuchsia;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: FluttermojiCircleAvatar(
              radius: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: FluttermojiCustomizer(
              //scaffoldHeight: 400,
              // showSaveWidget: true,
              scaffoldWidth: isWeb ? 600 : 0,
            ),
          ),
        ],
      ),
    );
  }
}
