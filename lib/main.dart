import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habittracker/screens/login_page.dart';
import 'package:habittracker/screens/sign_up_page.dart';

import 'package:habittracker/utilities/colors.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.background, // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          title: 'Habit Tracker PLP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: AppColor.background,
          ),
          home: LoginPage(),
          routes: {
            '/signup': (context) => SignUpPage(),
          },
        );
      }),
    );
  }
}
