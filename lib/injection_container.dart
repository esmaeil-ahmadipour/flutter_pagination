import 'package:flutterpagination/data/generator/list_data_source.dart';
import 'package:flutterpagination/ui/screens/list/list_bloc.dart';
import 'package:kiwi/kiwi.dart';
void initKiwi(){
  Container().registerFactory((c)=>ListDataSource());
  Container().registerFactory((c)=>ListBloc(c.resolve()));

}