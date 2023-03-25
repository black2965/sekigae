import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:sekigae/app_theme.dart';
import 'package:sekigae/util/make_init_file_name.dart';
import 'package:sekigae/util/pdf_creator.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppTheme.floating_button_color,
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
                backgroundColor: AppTheme.background_color,
                title: Text('同じ名前のファイルが存在しています',style: Theme.of(context).textTheme.bodySmall,),
                content: Container(
                    width: 300,
                    child: Text('別名で保存または上書き保存してください',style: Theme.of(context).textTheme.bodyLarge,)
                ),
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsets.only(bottom: 15, top:15),
                actions: <Widget>[
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states){
                              if(states.contains(MaterialState.pressed)){
                                return AppTheme.primary_color;
                              }
                              return AppTheme.primary_color;
                            }
                        ),
                      ),
                      onPressed: () {
                        overWrite = false;
                        Navigator.pop(context);
                      },
                      child: const Text('別名で保存'),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states){
                              if(states.contains(MaterialState.pressed)){
                                return AppTheme.primary_color;
                              }
                              return AppTheme.primary_color;
                            }
                        ),
                      ),
                      onPressed: () {
                        overWrite = true;
                        Navigator.pop(context);
                      },
                      child: const Text('上書き保存'),
                    ),
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
