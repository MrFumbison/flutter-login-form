 import 'package:flutter/material.dart';
 import 'screens/login_screen.dart';

 class App extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      title: "log me in",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('log me in'),
        ),
        body: LoginScreen(),
        ),
    );
  }
 }