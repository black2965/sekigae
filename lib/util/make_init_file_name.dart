//例
//MakeInitFileName file = MakeInitFileName ('Seat', 'pdf');
//print(file.fileName);
//    ==> Seat-2023-1-23.pdf

class MakeInitFileName{
  //Public
  //生成されたファイル名
  late final String fileName;

  //Private
  final DateTime _now = DateTime.now();
  late final int _year = _now.year;
  late final int _month = _now.month;
  late final int _day = _now.day;
  late final String _fileTitle;
  late final String _fileType;

  MakeInitFileName (this._fileTitle, this._fileType){
    fileName = "$_fileTitle-$_year-$_month-$_day.$_fileType";
  }
}

