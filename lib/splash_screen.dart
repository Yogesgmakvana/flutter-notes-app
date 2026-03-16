import 'dart:async';

import 'package:flutter/material.dart';
import 'package:topic14/tasy_s.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5),(){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>TasyS()));

});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 950,
          width: double.infinity,
          child: Image.asset('assets/splash_pic.png',fit: BoxFit.cover,)),
      ),
    );
  }
}