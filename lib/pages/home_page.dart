import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sekigae/app_theme.dart';
import 'package:sekigae/pages/customize_page.dart';
import 'package:sekigae/pages/guide_page.dart';
import 'package:sekigae/pages/info_page.dart';

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
      backgroundColor: AppTheme.background_color,
      appBar: AppBar(
          backgroundColor:AppTheme.app_bar_color ,
        title: Text("席替え侍", style: Theme.of(context).textTheme.titleLarge),
        actions: <Widget>[
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppTheme.app_bar_color,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
            icon: const Icon(Icons.info_outline, color: AppTheme.white_text_color,),
            label: Text("情報" ,style: Theme.of(context).textTheme.titleSmall),
          ),
        ]
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "席替え侍",
          style: TextStyle(fontSize: 50, color: AppTheme.text_color),
        ),
        const Text(
          "開発版",
          style: TextStyle(fontSize: 25, color: AppTheme.text_color),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          child: const Text("名簿ファイルを読み込む (.csv)" ,style: TextStyle(color: AppTheme.white_text_color),),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
                dialogTitle: "名簿ファイルを選んでください");
            if (result != null) {
              CsvReader csv =CsvReader(result.paths);
              List<Map<String,dynamic>> member = await csv.read();
              if (!mounted) return;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomizePage(member: member,)));
            } else {}
          },
        ),
        const SizedBox(height: 50),
        const Text('初めての方は名簿ファイルを作る必要があります',style: TextStyle(color: AppTheme.text_color),),
        const SizedBox(height: 10),
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GuidePage()));
            },
            child: const Text("名簿ファイルの作り方はこちら ＞",style: TextStyle(color: AppTheme.link),),
            )
      ])),
    );
  }
}
