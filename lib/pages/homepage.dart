import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:habit_tracker_plp/helpers/create_habit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker_plp/helpers/todo.dart';
import '../helpers/habit_progressbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Habit> _habits = [];
  List<ToDo> _toDoItems = [];
  final _textController = TextEditingController();
  final _toDoItemController = TextEditingController();
  final _dueDateController = TextEditingController();

  @override
  void initState() {
    var user = _auth.currentUser;
    String userId = user!.uid;
    print("The user ID is ${userId}");
    super.initState();
    database
        .ref()
        .child("user_id: ${userId}")
        .child("habits")
        .onValue
        .listen((event) {
      Map<dynamic, dynamic>? habits = event.snapshot.value as Map?;
      if (habits != null) {
        List<Habit> habitList = [];
        habits.forEach((key, value) {
          habitList.add(Habit.fromMap({...value, "ID": key}));
        });
        setState(() {
          _habits = habitList;
        });
        List<String> habitStrings =
            _habits.map((habit) => habit.toString()).toList();
        print(habitStrings);
      }
    });

    database
      .ref()
      .child("user_id: ${userId}")
      .child("to-do_lists")
      .onValue
      .listen((event) {
        Map<dynamic, dynamic>? todoItems = event.snapshot.value as Map?;
        if (todoItems != null){
          List<ToDo> todoList = [];
          todoItems.forEach((key,value){
            todoList.add(ToDo.fromMap({...value, "name":key}));
          });
        }

    });

  }

  static const List<Widget> _pages = <Widget>[
    Icon(Icons.home, size: 150),
    Icon(Icons.stacked_line_chart_outlined, size: 150),
    Icon(Icons.add, size: 150),
    Icon(Icons.notifications, size: 150),
    Icon(Icons.settings, size: 150)
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateHabit(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = _auth.currentUser;
    String userId = user!.uid;
    print("The habits are, ${_habits}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Habits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child:  ListView.builder(
                  itemCount: _habits.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_habits[index].name),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HabitProgressBar(
                                startDate: _habits[index].start_date,
                                endDate: _habits[index].end_date,
                              ),
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        // Show a dialog to get the new name for the habit
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Edit Habit"),
                                              content: TextField(
                                                controller: _textController,
                                                decoration:
                                                InputDecoration(labelText: "Name"),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: Text("Save"),
                                                  onPressed: () {
                                                    var user = _auth.currentUser;
                                                    String userId = user!.uid;
                                                    // Update the habit in Firebase
                                                    FirebaseDatabase.instance
                                                        .ref()
                                                        .child("user_id: $userId")
                                                        .child("habits")
                                                        .child(_habits[index].id)
                                                        .update({
                                                      "name": _textController.text,
                                                    });

                                                    // Close the dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () {
                                                    // Close the dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        database
                                            .ref()
                                            .child("user_id: ${userId}")
                                            .child("habits")
                                            .child(_habits[index].id.toString())
                                            .remove();
                                      },
                                    ),
                                  ],
                                ),
                              ),

                            ]),
                      ),
                    );
                  },
                ),


            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text(
                      "To-Do Lists",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _toDoItems.length,
                        itemBuilder: (context, index){
                          return CheckboxListTile(value: _toDoItems[index].isDone, onChanged: (value) {
                            setState(() {
                              _toDoItems[index].name = value! as String;
                            });
                            print(_toDoItems);

                          });
                        },
                      ),

                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text("Create To-Do"),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (builder){
                              return AlertDialog(
                                title: Text("Create To-Do"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _toDoItemController,
                                      decoration: InputDecoration(labelText: "Task"),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: _dueDateController,
                                      decoration: InputDecoration(labelText: "Due Date"),
                                      keyboardType: TextInputType.datetime,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Save"),
                                    onPressed: () {
                                      var user = _auth.currentUser;
                                      String userId = user!.uid;
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("user_id: $userId")
                                          .child("to-do_lists")
                                          .push()
                                          .set({
                                        "item_name": _toDoItemController.text,
                                        "due_date": _dueDateController.text,
                                      });
                                      Navigator.of(context).pop();

                                    },
                                  ),
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      _toDoItemController.clear();
                                      _dueDateController.clear();
                                      Navigator.of(context).pop();

                                    },
                                  )
                                ],

                              );
                            }

                        );
                      },
                    )
                  ],
                )
              )
            )

          ],

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Today'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.stacked_line_chart_outlined,
                color: Colors.black,
              ),
              label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Colors.amber,
              ),
              label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Habit {
  String id;
  String name;
  String createdAt;
  DateTime start_date;
  DateTime end_date;
  double progress;

  Habit(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.start_date,
      required this.end_date,
      required this.progress});

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
        id: map["ID"],
        name: map["name"],
        createdAt: map["created_at"],
        start_date: DateTime.parse(map["start_date"]),
        end_date: DateTime.parse(map["end_date"]),
        progress: map["progress"]);
  }

  @override
  String toString() {
    return 'Habit{id: $id, name: $name, createdAt: $createdAt}, start_date: ${start_date}, end_date: ${end_date}, progress: $progress';
  }
}


