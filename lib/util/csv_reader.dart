import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:async';

class CsvReader{
  late String _path;
  final List<Map<String, dynamic>> member = [];

  CsvReader(List paths){
    _path = paths[0];
  }

  Future<List<Map<String, dynamic>>> read() async{
    final input = File(_path).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(CsvToListConverter(eol: '\n'))
        .toList();

    for (int i = 0; i < fields.length; i++) {
      List person = fields[i];

      bool isFront = _frontTransform(person[2]);

      Map<String, dynamic> map = {
        "number": person[0],
        "name": person[1],
        "front": isFront
      };
      member.add(map);
    }
    return member;
  }
}

bool _frontTransform (dynamic front){
  final bool isFront;
  if(front == 1){ //希望あり 1
    isFront = true;
  }else{          //希望なし 0 または null
    isFront = false;
  }
  return isFront;
}
