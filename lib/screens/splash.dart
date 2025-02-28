// ignore_for_file: prefer_const_constructors, annotate_overrides, use_build_context_synchronously

import 'package:fakestoreapi/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 
  void initState() {
    goSignIn();
    super.initState();
  }

  Future<void>goSignIn()async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(child: Text("Fake Store",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: colorScheme.primary
      ),
      )),
    );
  }
}