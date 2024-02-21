// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:form_test/Screens/home.dart';
// import 'package:test_form/Screens/home.dart';

void main() {
  runApp(MyForm());
}

class MyForm extends StatelessWidget {
  MyForm({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
