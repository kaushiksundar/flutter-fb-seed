import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter FB Seed',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Firebase Seed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Flutter Firebase seed',
              ),
              StreamBuilder(
                stream: Firestore.instance.collection('settings').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading..');
                  return Text(snapshot.data.documents[0]['version']);
                },
              ),
              MaterialButton(
                child: Text(
                  'Get started',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: _goToLoginScreen,
              )
            ],
          ),
        ));
  }

  void _goToLoginScreen() {
    //TODO: Navigate to Login screen
  }
}
