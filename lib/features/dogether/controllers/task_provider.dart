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

  void changeStatus(int id, String title, String desc, int isCompleted,
      String date, int ownerId, int listId) async {
    int newStatus;
    if (isCompleted == 0) {
      newStatus = 1;
    } else {
      newStatus = 0;
    }
    await DBHelper.updateTask(
        id, title, desc, newStatus, date, ownerId, listId);

    refresh(listId);
  }

  bool getStatus(TaskModel data) {
    bool? isCompleted;

    if (data.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }

    return isCompleted;
  }

  bool isVisible(bool visible) {
    return visible;
  }

  Future<void> deleteTask(int id, int lid) async {
    await DBHelper.deleteTask(id);
    refresh(lid);
  }
}
