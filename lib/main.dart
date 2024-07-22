import 'package:flutter/material.dart';
import 'package:test_project/core/constants/string_constants.dart';
import 'package:test_project/initialize/initialize.dart';
import 'package:test_project/screen/home_screen/home_screen.dart';

void main() async {
  await Initialize.appInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
