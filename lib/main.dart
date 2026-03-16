import 'package:flutter/material.dart';
import 'package:topic14/manage/child_screen.dart';
import 'package:topic14/manage/my_form.dart';
import 'package:topic14/manage/screen_one.dart';
import 'package:topic14/splash_screen.dart';
import 'package:topic14/manage/task_system.dart';
import 'package:topic14/tasy_s.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SplashScreen(),
    );
  }
}

