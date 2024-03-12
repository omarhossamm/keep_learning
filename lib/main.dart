import 'package:flutter/material.dart';
import 'package:keep_learning/screens/countries_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountriesScreen(),
    );
  }
}