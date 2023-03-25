import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:sekigae/util/make_init_file_name.dart';
import 'package:sekigae/util/pdf_creator.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(Icons.picture_as_pdf),
      label: const Text("座席表をPDFで出力"),
      onPressed: () async {
        String? path;

        for (;;) {
          MakeInitFileName file = MakeInitFileName('Seat', 'pdf');
          String fileName = file.fileName;
          path = await FilePicker.platform.saveFile(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
            dialogTitle: 'PDFファイルを保存する場所を選んでください',
            fileName: fileName,
          );
          if (path == null || File(path).existsSync() == false) {
            //キャンセルした または 同じ名前のファイルが存在しない
            break;
          } else {
            //同じ名前のファイルが存在する
            bool overWrite = false;
            await showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('すでに同じ名前のファイルがあります'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      overWrite = false;
                      Navigator.pop(context);
                    },
                    child: const Text('別の名前で保存する'),
                  ),
                  TextButton(
                    onPressed: () {
                      overWrite = true;
                      Navigator.pop(context);
                    },
                    child: const Text('上書きする'),
                  ),
                ],
              ),
            );
            if (overWrite) {
              break;
            }
          }
        }
        int saveStatus = await save(path!);
        if (saveStatus == -1) {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  _alertBuilder(context, "保存に失敗しました"));
        }
      },
    );
  }

  AlertDialog _alertBuilder(BuildContext context, String msg) {
    return AlertDialog(
      content: Text(msg),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'))
      ],
    );
  }

  Future<int> save(String path) async {
    final pdf_widgets.Document pdf = await PdfCreator.create();
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    return 0;
  }
}
