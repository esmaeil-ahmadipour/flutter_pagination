import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as DI;
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
final _listBloc=DI.Container.scoped();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Paginated'),),

    );
  }
}
