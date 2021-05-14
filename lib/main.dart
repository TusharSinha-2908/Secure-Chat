import 'package:flutter/material.dart';
import 'package:encrypted_sms/Send.dart';
import 'Inbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Secure Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              labelColor: Colors.white,
              tabs: [
                Tab(text: 'Send'),
                Tab(text: 'Inbox'),
              ],
            ),
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Send(),
              Inbox(),
            ],
          ),
        ),
      ),
    );
  }
}
