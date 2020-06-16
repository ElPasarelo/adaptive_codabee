import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_codabee/adaptivecodabee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Test",
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Adaptive.text(string: "${Adaptive.isIOS()}", color: Colors.pink),
            Adaptive.button(child: Adaptive.text(string: "Erreur"), onPressed: () {
              Adaptive.alert(context: context, callback: () {
                print("Success");
                Navigator.of(context).pop();
              });
            })
          ],
        )
        )
    );
  }
}
