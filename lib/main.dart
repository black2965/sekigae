import 'package:flutter/material.dart';
import 'package:sekigae/app_theme.dart';
import 'pages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppTheme.app_primarySwatch_color,
      ),
      home: const TestPage(),
    );
  }
}
