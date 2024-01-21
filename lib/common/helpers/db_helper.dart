import 'package:dogether/common/models/list_model.dart';
import 'package:dogether/common/models/task_model.dart';
import 'package:dogether/common/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  // Create tables for our DB

  static Future<void> createTables(sql.Database database) async {
    await database.execute(''' 
        CREATE TABLE user (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          isVerified INTEGER NOT NULL,
          photoUrl TEXT,
        )    

    ''');
    await database.execute(''' 
        CREATE TABLE list (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          creatorId INTEGER NOT NULL,

          FOREIGN KEY(creatorId) REFERENCES user(id)
        )
    
    ''');
    await database.execute(''' 
        CREATE TABLE task (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          desc TEXT,
          isCompleted INTEGER NOT NULL, 
          date TEXT,
          ownerId INTEGER NOT NULL,
          listId INTEGER NOT NULL,

          FOREIGN KEY(ownerId) REFERENCES user(id)
          FOREIGN KEY(listId) REFERENCES list(id)
        )
    
    ''');
  }

  // init DB
  static Future<sql.Database> db() async {
    return sql.openDatabase('dogether', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  // CRUD Ops
  static Future<int> createTask(TaskModel task) async {
    final db = await DBHelper.db();

    final id = await db.insert('task', task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createUser(UserModel user) async {
    final db = await DBHelper.db();

    final id = await db.insert('user', user.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createList(ListModel list) async {
    final db = await DBHelper.db();

    final id = await db.insert('list', list.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await DBHelper.db();

    return db.query('task', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getTask(int id) async {
    final db = await DBHelper.db();

    return db.query('task', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getLists() async {
    final db = await DBHelper.db();

    return db.query('list', orderBy: 'id');
  }

  static Future<int> updateTask(int id, String title, String desc,
      int isCompleted, String date, int ownerId, int listId) async {
    final db = await DBHelper.db();

    final data = {
      "title": title,
      "desc": desc,
      "isCompleted": isCompleted,
      "date": date,
      "ownerId": ownerId,
      "listId": listId,
    };

    final results =
        await db.update('task', data, where: "id = ?", whereArgs: [id]);

    return results;
  }

  static Future<void> deleteTask(int id) async {
    final db = await DBHelper.db();

    try {
      db.delete('task', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Unable to delete $e");
    }
  }

  static Future<void> deleteList(int id) async {
    final db = await DBHelper.db();

    try {
      db.delete('task', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Unable to delete $e");
    }
  }
}
