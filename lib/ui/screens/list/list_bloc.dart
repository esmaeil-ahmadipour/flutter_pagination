import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  @override
  ListState get initialState => InitialListState();

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
