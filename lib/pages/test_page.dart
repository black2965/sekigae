import 'package:flutter/material.dart';
import 'package:sekigae/pages/export_page.dart';
import 'package:sekigae/pages/home_page.dart';
import 'package:sekigae/pages/info_page.dart';
import 'package:sekigae/pages/result_page.dart';
import 'package:sekigae/pages/customize_page.dart';

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
            const Text("テストページ"),
            TextButton(
              child: const Text("Export Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExportPage()));
              },
            ),
            TextButton(
              child: const Text("Customize page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomizePage()));
              },
            ),
            TextButton(
              child: const Text("Home Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            TextButton(
              child: const Text("Info Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoPage()));
              },
            ),
            TextButton(
              child: const Text("Result Page"),
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