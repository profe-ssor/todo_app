import 'package:flutter/material.dart';
import 'package:todo_app/pages/loading.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/screen.dart';
import 'package:todo_app/pages/signup.dart';
import 'package:todo_app/pages/Login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes:  {
    '/': (context) => LoadingPage(),
    '/home':(context) => TodoApp(),
     '/screen':(context) => TodoScreen(),
     '/signup':(context) => Signup(),
     '/login':(context) => Login(),
},
  ));
}


