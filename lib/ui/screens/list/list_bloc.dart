import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterpagination/data/generator/list_data_source.dart';
import './bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListDataSource _dataSource;

  ListBloc(this._dataSource);

  void getNextListPage() {
    add(FetchNextPage());
  }

  @override
  ListState get initialState => ListState.initial();


  @override
  Stream<ListState> _bindEventsToStates(
      ListState currentState, ListEvent event) async* {
    if (event is FetchNextPage) {
      try {
        final nextPageItems = await _dataSource.getNextListPage();
        yield ListState.success(currentState.listItems + nextPageItems);
      } on NoNextPageException catch (_) {
        yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
      }
    }
  }


}
