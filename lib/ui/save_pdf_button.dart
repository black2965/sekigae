import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavePDFButton extends StatelessWidget {
  const SavePDFButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async{
        // String? path = await FileSaver ();
        // print(path);
        String? path;
        for(;;){
          String fileName = makeInitFileName();
          path = await FilePicker.platform.saveFile(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
            dialogTitle: 'PDFファイルを保存する場所を選んでください',
            fileName: fileName,
          );
          if (path == null || File(path).existsSync() == false) {
            //キャンセルした または 同じ名前のファイルが存在しない
            break;
          }else{
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
            if (overWrite){
              break;
            }
          }
        }
      },
      icon: const Icon(Icons.picture_as_pdf),
      label: const Text("座席表をPDFで出力"),
    );
  }
}

String makeInitFileName (){
  DateTime now = DateTime.now();
  int year = now.year;
  int month = now.month;
  int day = now.day;
  String fileName = "Seat-$year-$month-$day.pdf";

  return fileName;
}
