import 'package:flutter/material.dart';
import 'package:sekigae/util/seat.dart';

class SeatTable extends StatelessWidget {
  final Seat seat;
  final int height;
  final int width;
  late final List<Map<String, dynamic>> list;
  late final int number;  //人数
  late final int horizontal; //縦の行数
  late final int vertical; //横の列数
  late final bool isAlignLeft; //左よりかどうか
  late final Table table;

  late final double boxHeight; //マス目の高さ
  late final double boxWidth; //マス目の幅

  SeatTable(
      {Key? key, required this.height, required this.width, required this.seat})
      : super(key: key) {
    //!例外処理
    if (seat.column == 0 || seat.resultSeats.isEmpty) {
      table = Table(
        children: const [
          TableRow(children: [
            TableCell(
              child: Text("結果を正しく表示できません"),
            )
          ])
        ],
      );
      return;
    }
    //*必要な条件を代入していく
    list = seat.resultSeats;
    number = list.length;
    vertical = seat.column;
    horizontal = (list.length / vertical).ceil();
    isAlignLeft = seat.isAlignLeft;

    //1マスの高さ 幅を計算
    boxHeight = height / horizontal;
    boxWidth = width / vertical;

    //*余る席の処理
    //余りの人数分 空の人間を作成
    for (int i = 0; i < horizontal * vertical - number; i++) {
      Map<String, dynamic> map = {
        "number": null,
        "name": " ",
        "front": false,
      };
      list.add(map);
    }

    //*Tableを作成
    //Tableのchildrenに渡す配列
    List<TableRow> assembly = [];
    //行数ぶんTableRowを作成
    for (int i = 0; i < horizontal; i++) {
      //TableRowのchildrenに渡す配列
      List<TableCell> cell = [];
      //列数ぶんTableCellを作成
      for (int j = 0; j < vertical; j++) {
        //人の情報を取得
        Map<String, dynamic> person = list[i * vertical + j];
        int? numInt = person["number"];
        //number != null ならそのまま表示
        String numStr = numInt != null ? numInt.toString() : " ";
        String name = person["name"];
        //マスの中身を作成
        SizedBox content = SizedBox(
          height: boxHeight,
          width: boxWidth,
          child: Center(child: Text("$numStr $name")),
        );
        TableCell box = TableCell(child: content);

        cell.add(box);

        //最後の行なら寄せの判定
        if (i == horizontal - 1) {
          //trueなら処理なしで既に左に寄っている
          if (isAlignLeft == false) {
            cell = List.from(cell.reversed);
          }
        }
      }
      TableRow row = TableRow(children: cell);
      assembly.add(row);
    }
    //ListをもとにTableを作成
    table = Table(
      children: assembly,
      border: TableBorder.all(color: Colors.black, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        height: height.toDouble() + 2,
        width: width.toDouble() + 2,
        child: table,
      ),
    );
  }
}
