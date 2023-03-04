import 'package:flutter/material.dart';
import 'package:sekigae/pages/export_page.dart';
import 'package:sekigae/pages/home_page.dart';
import 'package:sekigae/pages/result_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("テスト用ページ"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("テストページ"),
            TextButton(
              child: Text("Export Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExportPage()));
              },
            ),
            TextButton(
              child: Text("Home Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            TextButton(
              child: Text("Result Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
