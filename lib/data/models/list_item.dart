import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'list_item.g.dart';

abstract class ListItem implements Built<ListItem, ListItemBuilder> {
  String get title;
  int get colorInt;

  ListItem._();
  factory ListItem([void Function(ListItemBuilder) updates]) = _$ListItem;
}