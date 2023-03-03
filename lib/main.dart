import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("席替えアプリです。機能はこれから作ります")),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("席替えアプリ製作中だよ",
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(height: 20),
          Image.network(
            'https://avatars.githubusercontent.com/u/126380598?s=200&v=4'
          )
        ],
      )),
    );
  }
}
