import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:sekigae/pages/preview_page.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({Key? key}) : super(key: key);

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("結果の保存"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("出力"),
                  onPressed: () async {
                    String? path = await getSavePath(
                      acceptedTypeGroups: [
                        const XTypeGroup(label: 'pdf', extensions: ['pdf'])
                      ],
                      suggestedName: "seat.pdf",
                    );
                  }
                ),
                ElevatedButton(
                    child: const Text("プレビュー"),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PreviewPage(),
                        ),
                      );
                    }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
