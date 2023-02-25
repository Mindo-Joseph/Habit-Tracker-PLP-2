import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ToDo {
  String name;
  String dueDate;
  bool isDone;

  ToDo(
      { required this.name, required this.dueDate, this.isDone = false});

  factory ToDo.fromMap(Map<String, dynamic> map){
    return ToDo(
      name: map["item_name"],
      dueDate:map["due_date"],


    );
  }
}

class ToDoItem extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoItem> {
  List<ToDo> _toDoItems = [];
  final databaseReference = FirebaseDatabase.instance.reference();
  final _textController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _toDoItems.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_toDoItems[index].name),
                    value: _toDoItems[index].isDone,
                    onChanged: (value) {
                      setState(() {
                        var user = _auth.currentUser;
                        String userId = user!.uid;
                        _toDoItems[index].isDone = value!;
                        databaseReference
                            .child("to-do_lists")
                            .child("user_id: $userId")
                            .update({
                          "isDone": value,
                        });
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Enter To-Do item",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: _dueDateController,
                decoration: InputDecoration(
                  hintText: "Due Date",
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Create To-Do Item"),
                onPressed: () async {
                  var toDoItem = ToDo(
                    name: _textController.text,
                    dueDate: _dueDateController.text,
                  );
                  final snapshot = await databaseReference
                      .child("todos")
                      .push()
                      .set(toDoItem);
                  setState(() {
                    _toDoItems.add(toDoItem);
                    _textController.clear();
                    _dueDateController.clear();
                  });
                },
              )
              ,
            )
            ,
          ]
          ,
        )
    );
  }
}

