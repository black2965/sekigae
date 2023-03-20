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
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('ホームへ戻りますか？'),
                content: const Text('席替え結果は破棄され、二度と見ることができなくなります。'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    child: const Text('ホームへ戻る'),
                  ),
                ],
              ),
            ),
            icon: const Icon(Icons.home),
            label: const Text("ホームへ戻る")
          )
        ]
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
