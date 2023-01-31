import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:habit_tracker_plp/pages/sign_up_page.dart';
import 'package:habit_tracker_plp/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Your Project Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
