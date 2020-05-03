import 'package:meta/meta.dart';

@immutable
abstract class ListEvent {}
class Search extends ListEvent {}
class FetchNextPage extends ListEvent {}
