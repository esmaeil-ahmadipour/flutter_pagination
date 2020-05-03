import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutterpagination/data/models/list_item.dart';

class ListDataSource {
  static const int ITEM_PER_PAGE = 20;
  static const int PAGE_COUNT = 5;
  static final _randomGenerator = Random();

  int _shownPagesCount = 0;

  Future<BuiltList<ListItem>> getNextListPage() async {
    if (_shownPagesCount >= PAGE_COUNT) {
      throw NoNextPageException();
    }
    _shownPagesCount++;

    await Future.delayed(Duration(milliseconds: 750));
    return BuiltList.of(
      List.generate(ITEM_PER_PAGE, _generateItemList),
    );
  }

  ListItem _generateItemList(int index) {
    return ListItem((b) => b
      ..title = '$index Lorem Ipsum'
      ..colorInt = _randomGenerator.nextInt(0xFFFFFFFF));
  }
}

class NoNextPageException implements Exception {}
