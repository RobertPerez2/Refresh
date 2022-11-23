import 'package:flutter/material.dart';
import 'database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'util/individual.dart';
import 'util/dialog.dart';
import 'package:lottie/lottie.dart';
import 'util/emoji_face.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  final myBox_ = Hive.box('myBox');
  TaskDataBase taskData = TaskDataBase();

  @override
  void initState() {
    if (myBox_.get("TASKLIST") == null) {
      taskData.makeDataFirstOpen();
    } else {
      taskData.uploadData();
    }
    super.initState();
  }

  final controller_ = TextEditingController();

  void checkChanged(bool? value, int index) {
    setState(() {
      taskData.taskList[index][1] = !taskData.taskList[index][1];
    });
    taskData.updateData();
  }

  void saveTask() {
    setState(() {
      taskData.taskList.add([controller_.text, false]);
      controller_.clear();
    });
    Navigator.of(context).pop();
    taskData.updateData();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogAnswer(
          controller: controller_,
          onSave: saveTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  void deleteTask_(int index) {
    setState(() {
      taskData.taskList.removeAt(index);
    });
    taskData.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:' '),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarms_sharp), label:' '),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Column(
                children: [
                  SizedBox(height:15),
                  Row( children: const [
                    Text(
                      'Welcome to Refresh!',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Color(0xFFFFFFFF),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],),
                  //Animation
                  SizedBox(height:15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Lottie.network(
                      'https://assets8.lottiefiles.com/packages/lf20_unJ8q8.json',
                      height: 200,
                      width: 600,
                      fit: BoxFit.fill,
                  ),
                  ],),
                  SizedBox(height:20),
                  //How do you feel today? Row
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        'How do you feel today?',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color(0xFFFFFFFF),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox( height: 4),
                      Text(
                        '11 November, 2011',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                        ),),
                    ],),
                    Icon(Icons.more_horiz,
                        color: Colors.white,
                    ),
                  ],),
                  SizedBox(height: 8),
                  //emoticons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Column(
                      children: [
                        emoji_face( emojiface: '(¬‿¬)',
                        ),
                        SizedBox(height: 4),
                        Text(
                            "Cool",
                          style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        emoji_face( emojiface: 'ʕ•́ᴥ•̀ʔ',
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Okay",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        emoji_face( emojiface: '(╥﹏╥)',
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bad",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        emoji_face( emojiface: '(≖_≖ )',
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Angry",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                          ),),
                      ],),
                  ],),
                ],),
            ),
            const SizedBox(height:20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                color: Colors.grey[100],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Task List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                              fontSize: 20,
                            ),),
                          Icon(Icons.more_horiz),
                        ],),
                    Expanded(
                      child: ListView.builder(
                        itemCount: taskData.taskList.length,
                        itemBuilder: (context, index) {
                          return Individual(
                            taskName: taskData.taskList[index][0],
                            completedTask: taskData.taskList[index][1],
                            onChanged: (value) => checkChanged(value, index),
                            deleteTask: (context) => deleteTask_(index),
                          );
                        },
                      ),),

                    ],),
                ),
              ),
            ),

          ],),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Color(0xFF81D4FA),
            size: 30.0,
          )
      ),
    );
  }
}