import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('名簿ファイルの作り方')
      ),
      body: Center(
        child: SizedBox(
          width: 700,
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('1. 表計算ソフトを開く',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5,),
                      Text('Microsoft Excel、LibreOffice Calc などの表計算ソフトを開いてください。')
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text('2. 名簿を作る',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5,),
                      Text('次の形式で名簿を作成してください'),
                      Text('  A列: 出席番号'),
                      Text('  B列: 名前'),
                      Text('  C列: 前方の席を希望するかどうか'),
                      Text('  　　　希望する場合→ 1'),
                      Text('  　　　希望しない場合→ 0 または何も入力しない'),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/images/guide_page_example.png'),height: 150,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text('3. CSVファイルで出力する',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5,),
                      Text('Microsoft Excel',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('  '),
                      Text('LibreOffice Calc',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('  ファイル(F) ＞ 名前を付けて保存(A)... と進み、形式は『テキスト CSV(.csv)』を選んで出力してください。'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text('4. このアプリで読み込む',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 5,),
                      Text('　このアプリのトップ画面の『名簿ファイルを読み込む(.csv)』をクリックして、表計算ソフトで出力したCSVファイルを選択してください。')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

