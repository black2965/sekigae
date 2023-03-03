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
        title: Center(
            child: const Text("席替えアプリ")
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Intel ARC"),
              Image.network('https://www.intel.co.jp/content/dam/www/central-libraries/us/en/images/arc-sigid-dark-standard-jap.jpg.rendition.intel.web.480.270.jpg')
            ],
          )
      ),
    );
  }
}
