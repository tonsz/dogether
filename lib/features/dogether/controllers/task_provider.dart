import 'package:dogether/common/helpers/db_helper.dart';
import 'package:dogether/common/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_provider.g.dart';

@riverpod
class TaskState extends _$TaskState {
  @override
  List<TaskModel> build() {
    return [];
  }

  void refresh(int lid) async {
    final data = await DBHelper.getTasks(lid);
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addTask(TaskModel task, int lid) async {
    await DBHelper.createTask(task);
    refresh(lid);
  }

  Future<void> deleteTask(int id, int lid) async {
    await DBHelper.deleteTask(id);
    refresh(lid);
  }
}
