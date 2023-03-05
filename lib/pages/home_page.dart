import 'package:flutter/material.dart';

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
        title: const Center(child: Text("席替え侍")),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "席替え侍",
            style: TextStyle(fontSize: 50),
          ),
          Text(
            "開発版",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text("CSVファイルを選ぶ"),
            onPressed: () {
              //ファイルピッカーを開く
            },
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: "席替え侍",
                applicationVersion: "開発版"
              );
            },
            child: Text("席替え侍について"),
          )
        ]
      )),
    );
  }
}
