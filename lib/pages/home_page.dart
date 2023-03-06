import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
            onPressed: () async{
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
                dialogTitle: "CSVファイルを選んでください"
              );
              if (result != null) {
                print(result.paths);
              } else {

              }
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
