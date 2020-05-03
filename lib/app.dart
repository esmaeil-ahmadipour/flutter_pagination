
import 'package:flutter/material.dart';
import 'package:flutterpagination/ui/screens/home_page.dart';
import 'package:flutterpagination/ui/screens/list/list_pages.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
