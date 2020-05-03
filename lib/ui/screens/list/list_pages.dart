import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpagination/data/models/list_item.dart';
import 'package:flutterpagination/ui/screens/list/list_bloc.dart';
import 'package:flutterpagination/ui/screens/list/list_state.dart';
import 'package:kiwi/kiwi.dart' as DI;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //set Changes On  This Line ..
  final _listBloc = DI.Container().resolve<ListBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listBloc.getNextListPage();
  }

  @override
  void dispose() {
    _listBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Paginated'),
      ),
      body: BlocBuilder(
        bloc: _listBloc,
        builder: (context, ListState state) {
          if (state.listItems.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: _handelScrollNotification,
              child: ListView.builder(
                  itemCount: calculateListItemCount(state),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return index>=state.listItems.length ?  _buildLoaderListItem():_buildDataListItem(state.listItems[index]) ;
                  }),
            );
          }
        },
      ),
    );
  }

  bool _handelScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _listBloc.getNextListPage();
    }
    return false;
  }

  int calculateListItemCount(ListState state) {
    if (state.hasReachedEndOfResults) {
      return state.listItems.length;
    } else {
      return state.listItems.length + 1;
    }
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDataListItem(ListItem item) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(shape: BoxShape.circle,
                color: Color(item.colorInt),

              ),
            ),
            SizedBox(width: 10.0),
            Text(item.title,style: TextStyle( fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}