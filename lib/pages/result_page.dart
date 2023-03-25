import 'package:flutter/material.dart';
import 'package:sekigae/app_theme.dart';
import 'package:sekigae/ui/save_button.dart';
import 'package:sekigae/util/pdf_creator.dart';
import 'package:sekigae/util/seat.dart';

import '../ui/seat_table.dart';

String date = "";
String title = "";
Seat seat = Seat([
  {
    "number": 0,
    "name": "エラー",
    "front": false,
  }
], 1, false);

class ResultPage extends StatefulWidget {
  ResultPage({Key? key, required Seat seatIn}) : super(key: key) {
    seat = seatIn;
  }

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background_color,
      appBar: AppBar(
          backgroundColor:AppTheme.app_bar_color ,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: AppTheme.background_color,
                title: Text('条件の設定ページへ戻りますか？',style: Theme.of(context).textTheme.bodySmall,),
                content: Container(
                    width: 300,
                    child: Text('席替え結果は保存されません',style: Theme.of(context).textTheme.bodyLarge,)
                ),
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsets.only(bottom: 15, top:15),
                actions: <Widget>[
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: AppTheme.background_color, // foreground
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('キャンセル',style: Theme.of(context).textTheme.bodyLarge,),
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
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('戻る',style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                ],
              ),
            ),
            icon: const BackButtonIcon(),
            tooltip: '戻る',
          ),
          title: Text("席替え結果",style: Theme.of(context).textTheme.titleLarge,),
          actions: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppTheme.app_bar_color,
                  elevation: 0,
                ),
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: AppTheme.background_color,
                        title: Text('ホームへ戻りますか？',style: Theme.of(context).textTheme.bodySmall,),
                        content: Container(
                            width: 300,
                            child: Text('席替え結果は保存されません',style: Theme.of(context).textTheme.bodyLarge,)
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding: const EdgeInsets.only(bottom: 15, top:15),
                        actions: <Widget>[
                          Container(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: AppTheme.background_color, // foreground
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: Text('キャンセル',style: Theme.of(context).textTheme.bodyLarge,),
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
                              onPressed: () => Navigator.popUntil(
                                  context, (route) => route.isFirst),
                              child: Text('戻る',style: Theme.of(context).textTheme.bodyLarge,),
                            ),
                          ),
                        ],
                      ),
                    ),
                icon: const Icon(Icons.home,color: AppTheme.white_text_color,),
                label: Text("ホームへ戻る" , style: Theme.of(context).textTheme.titleSmall ,),
            )
          ]),
      floatingActionButton: const SaveButton(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 800,
              child: Row(
                children: [
                  SizedBox(
                    width: 575,
                    child: TextField(
                      onChanged: (value) => title = value,
                      decoration: const InputDecoration(
                        hintText: "タイトルを入力",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) => date = value,
                      decoration: const InputDecoration(
                        hintText: "日付を入力",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          SeatTable(height: 500, width: 800, seat: seat),
        ],
      )),
    );
  }
}
