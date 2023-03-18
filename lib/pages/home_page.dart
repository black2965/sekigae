import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sekigae/pages/customize_page.dart';
import 'package:sekigae/pages/info_page.dart';
import 'dart:async';

import 'package:sekigae/util/csv_reader.dart';

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
        title: Row(
          children: [
            const Text("席替え侍"),
            const Expanded(child: SizedBox()),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InfoPage()));
              },
              icon: const Icon(Icons.info_outline),
              label: const Text("情報"),
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "席替え侍",
          style: TextStyle(fontSize: 50),
        ),
        const Text(
          "開発版",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          child: const Text("CSVファイルを選ぶ"),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
                dialogTitle: "CSVファイルを選んでください");
            if (result != null) {
              CsvReader csv =CsvReader(result.paths);
              List member = await csv.read();
              print(member);
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomizePage(member: member.length,)));
            } else {}
          },
        ),
      ])),
    );
  }
}
