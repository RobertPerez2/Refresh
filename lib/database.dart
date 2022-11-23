import 'package:hive_flutter/hive_flutter.dart';

class TaskDataBase {
  List taskList = [];
  final myBox_ = Hive.box('myBox');

  void makeDataFirstOpen() {
    taskList = [
      ["Reply Email", false],
    ];
  }

  void uploadData() {
    taskList = myBox_.get("TASKLIST");
  }

  void updateData() {
    myBox_.put("TASKLIST", taskList);
  }
}
