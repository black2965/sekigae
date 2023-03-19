/////////////////////////////////////////
//コンストラクタで席替え実行
//Seat seat = Seat(roster, column, alignLeft);
//
//結果、横の席数、左寄せかどうかを取得可能
// seat.resultSeats
// seat.column
// seat.isAlignLeft
//
//席替えを再実行
//seat.change();
// 再実行すると seat.resultSeats が書き換えられる
////////////////////////////////////////

class Seat{
  //Public
  List<Map<String,dynamic>> resultSeats = [];   //席替えの結果
  final int column;                                   //横の列数
  final bool isAlignLeft;                             //左寄せかどうか
  //Private
  final List<Map<String,dynamic>> _roster;  //名簿
  final List<Map<String,dynamic>> _normalPersons = [];  //希望がない人たち
  final List<Map<String,dynamic>> _frontPersons= [];  //前の席を希望する人たち

  //コンストラクタ
  Seat(this._roster, this.column, this.isAlignLeft){
    //希望がない人と、前の席を希望する人にわける
    _judgeFront();
    //席替えを実行
    change();
  }

  //席替えを再実行する場合はこのメソッドを使う
  change(){
    //希望がない人と、前の席を希望する人をあわせる
    final List<Map<String,dynamic>> allPersons = _attachFrontnormal();
    //席を作る
    resultSeats = _makeSeats(allPersons);
  }

  //Private
  //希望がない人と、前の席を希望する人にわける
  _judgeFront(){
    for (Map<String,dynamic> person in _roster){
      if(person["front"] != true){
        //希望なし
        _normalPersons.add(person);
      }else{
        //前の席を希望
        _frontPersons.add(person);
      }
    }
  }

  //希望がない人と、前の席を希望する人をあわせる
  List<Map<String,dynamic>> _attachFrontnormal(){
    //希望がない人と、前の席を希望する人をそれぞれシャッフル
    _normalPersons.shuffle();
    _frontPersons.shuffle();
    //合体
    final List<Map<String,dynamic>> allPersons = [];
    allPersons.addAll(_frontPersons);
    allPersons.addAll(_normalPersons);

    return allPersons;
  }

  //席を作る
  List<Map<String,dynamic>> _makeSeats(List<Map<String,dynamic>> allPersons){
    //希望がない人と、前の席を希望する人が、混ざる行があるかどうか
    final int remainder = _frontPersons.length % column;

    if(remainder == 0){
      //混ざる行がない場合
      return allPersons;
    }else{
      //混ざる行がある場合

      final int mixRowStart = _frontPersons.length - remainder;
      late int mixRowEnd;

      if ( (mixRowStart + (column -1) ) < allPersons.length -1){
        //混ざる行が一番うしろではない
        mixRowEnd = mixRowStart + (column -1);
      }else{
        //混ざる行が一番うしろである
        mixRowEnd = allPersons.length -1;
      }

      final List<Map<String,dynamic>> mixRow = allPersons.sublist(mixRowStart, mixRowEnd +1);
      mixRow.shuffle();
      allPersons.setAll(mixRowStart, mixRow);

      return allPersons;
    }
  }
}
