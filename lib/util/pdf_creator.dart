
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:sekigae/pages/result_page.dart';
import 'package:sekigae/ui/pdf_seat_table.dart';
import 'package:sekigae/util/seat.dart';

class PdfCreator {
  static Future<Document> create() async {
    final pdf = Document();
    final font = await PdfGoogleFonts.sawarabiGothicRegular();
    print("set format");

    final seatTable = PdfSeatTable(height: 500, width: 800, seat: seat);

    // 表紙
    final sheet = Page(
      pageTheme: PageTheme(
        theme: ThemeData.withFont(base: font),
        pageFormat: PdfPageFormat.a4.landscape,
        orientation: PageOrientation.landscape,
      ),
      build: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //write here
            SizedBox(
                width: 800,
                child: Row(
                  children: [
                    Container(
                      width: 500,
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 175,
                      child: Text(date),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            getSeat(height: 400, width: 700, seat: seat),
          ],
        ),
      ),
    );

    print("create page");

    pdf.addPage(sheet);
    return pdf;
  }

  static Widget getSeat(
      {required int height, required int width, required Seat seat}) {
    if (seat.column == 0 || seat.resultSeats.isEmpty) {
      Widget table = Column(
          children: [Text("結果を正しく表示できません")],
          mainAxisAlignment: MainAxisAlignment.center);
      return table;
    }
    //*必要な条件を代入していく
    List<Map<String, dynamic>> list = seat.resultSeats;
    int number = list.length;
    int vertical = seat.column;
    int horizontal = (list.length / vertical).ceil();
    bool isAlignLeft = seat.isAlignLeft;

    //1マスの高さ 幅を計算
    double boxHeight = height / horizontal;
    double boxWidth = width / vertical;

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
    List<Row> assembly = [];
    //行数ぶんTableRowを作成
    for (int i = 0; i < horizontal; i++) {
      //TableRowのchildrenに渡す配列
      List<Container> cell = [];
      //列数ぶんTableCellを作成
      for (int j = 0; j < vertical; j++) {
        //人の情報を取得
        Map<String, dynamic> person = list[i * vertical + j];
        int? numInt = person["number"];
        //number != null ならそのまま表示
        String numStr = numInt != null ? numInt.toString() : " ";
        String name = person["name"];
        //マスの中身を作成
        Container content = Container(
            height: boxHeight,
            width: boxWidth,
            child: Center(child: Text("$numStr $name")),
            decoration:
                BoxDecoration(border: Border.all(color: PdfColors.black)));
        cell.add(content);
      }

      //最後の行なら寄せの判定
      if (i == horizontal - 1) {
        //trueなら処理なしで既に左に寄っている
        if (isAlignLeft == false) {
          cell = List.from(cell.reversed);
        }
      }

      Row row =
          Row(children: cell, mainAxisAlignment: MainAxisAlignment.center);
      assembly.add(row);
    }
    //ListをもとにTableを作成
    Widget table =
        Column(children: assembly, mainAxisAlignment: MainAxisAlignment.center);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: PdfColors.black, width: 1),
        ),
        height: height.toDouble() + 2,
        width: width.toDouble() + 2,
        child: table,
      ),
    );
  }
}
