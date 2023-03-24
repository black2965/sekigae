import 'package:flutter/material.dart';
import 'package:sekigae/ui/save_pdf_button.dart';
import 'package:sekigae/util/seat.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.seat}) : super(key: key);
  final Seat seat;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed:  () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('条件の設定ページへ戻りますか？'),
              content: const Text('席替え結果は破棄され、二度と見ることができなくなります。'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('キャンセル'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('条件の設定ページへ戻る'),
                ),
              ],
            ),
          ),
          icon: const BackButtonIcon(),
          tooltip: '戻る',
        ),
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
      floatingActionButton: const SavePDFButton(),
      body: Center(
        child: Text("aaaaa"),
      ),
    );
  }
}
