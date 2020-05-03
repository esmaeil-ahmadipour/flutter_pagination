import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpagination/ui/screens/list/list_pages.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: ListPage(),
    );
  }
}
