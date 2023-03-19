import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("席替え結果"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {  },
        icon: const Icon(Icons.picture_as_pdf),
        label: const Text("座席表をPDFで出力"),
      ),
      body: const Center(
          child: Text("席替え結果")
      ),
    );
  }
}
