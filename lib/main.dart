import 'package:flutter/material.dart';
import 'package:sekigae/app_theme.dart';
import 'package:sekigae/pages/home_page.dart';
import 'testPages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "席替え侍",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppTheme.app_primarySwatch_color,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppTheme.white_text_color,
          ),
          titleSmall: TextStyle(
            color:AppTheme.white_text_color,
          ),
          bodyLarge: TextStyle(
            color: AppTheme.text_color,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: AppTheme.text_color,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: AppTheme.text_color,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ),
      home: const TestPage(),
    );
  }
}
