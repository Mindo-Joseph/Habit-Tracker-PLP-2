import 'dart:async';
import 'package:flutter/material.dart';

class HabitProgressBar extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  HabitProgressBar({
    required this.startDate,
    required this.endDate,
  });

  @override
  _HabitProgressBarState createState() => _HabitProgressBarState();
}

class _HabitProgressBarState extends State<HabitProgressBar> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (DateTime.now().difference(widget.startDate).inDays /
        widget.endDate.difference(widget.startDate).inDays);
    return Container(
      width: 100,
      height: 10,
      child: LinearProgressIndicator(
        value: progress,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}

