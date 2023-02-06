import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateHabit extends StatefulWidget{
  @override
  _CreateHabitState createState() => _CreateHabitState();

}

class _CreateHabitState extends State<CreateHabit>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your habit name'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Enter your habit name",
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter a habit name";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: ()  {
                if (_formKey.currentState!.validate()) {
                  var user = _auth.currentUser;
                  String userId = user!.uid;
                  database
                    .ref()
                      .child("user_id: $userId")
                      .child("habits")
                      .push()
                      .set({
                    "ID": DateTime.now().millisecondsSinceEpoch,
                    "name": _textController.text,
                    "created_at": DateTime.now().toIso8601String(),
                  });
                  Navigator.pop(context);

                }
              },
              child: Text("Create habit"),
            ),
          ],
        ),
      )
    );
  }
}