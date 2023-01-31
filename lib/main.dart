import 'package:flutter/material.dart';
import 'package:habittracker/utilities/colors.dart';
import 'package:habittracker/widgets/layout.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          home: const Layout(),
        );
      }),
    );
  }
}
