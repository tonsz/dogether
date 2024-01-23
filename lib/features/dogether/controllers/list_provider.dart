import 'package:dogether/common/helpers/db_helper.dart';
import 'package:dogether/common/models/list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_provider.g.dart';

@riverpod
class ListState extends _$ListState {
  @override
  List<ListModel> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getLists();
    state = data.map((e) => ListModel.fromJson(e)).toList();
  }

  void addList(ListModel list) async {
    await DBHelper.createList(list);
    refresh();
  }

  Future<void> deleteList(int id) async {
    await DBHelper.deleteList(id);
    refresh();
  }
}
