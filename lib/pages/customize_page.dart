import 'package:flutter/material.dart';
import 'package:sekigae/app_theme.dart';
import 'package:sekigae/pages/result_page.dart';
import 'package:sekigae/util/seat.dart';

class CustomizePage extends StatefulWidget {
  final List<Map<String, dynamic>> member;
  const CustomizePage({Key? key, required this.member}) : super(key: key);

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  late List<Map<String, dynamic>> member;
  late int number;
  int row = 0;
  bool? _value1 = true;
  bool? _value2 = false;

  @override
  void initState() {
    super.initState();
    member = widget.member;
    number = member.length;
    print(member);
  }

  void _setValue1(bool? value) {
    setState(() {
      _value1 = value;
      _value2 = !value!;
    });
  }

  void _setValue2(bool? value) {
    setState(() {
      _value1 = !value!;
      _value2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background_color,
      appBar: AppBar(backgroundColor:AppTheme.app_bar_color ,title:  Text('条件を設定', style: Theme.of(context).textTheme.titleLarge,)),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Text('人数', style: Theme.of(context).textTheme.bodyMedium,),
                title: Container(margin: const EdgeInsets.only(left:10) ,child: Text('$number人', style: Theme.of(context).textTheme.bodyMedium,)),
              ),
              ListTile(
                leading: Text('横の席数',style: Theme.of(context).textTheme.bodyMedium,),
                title: SizedBox(
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      decoration:
                          const InputDecoration( border: OutlineInputBorder(borderSide: BorderSide(width:0.0)),),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          row = int.tryParse(text) ?? 0;
                          print(row);
                        });
                      },
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text('最後列',style: Theme.of(context).textTheme.bodyMedium,),
                title: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: AppTheme.background_color,
                          activeColor: AppTheme.floating_button_color,
                          value: _value1,
                          onChanged: _setValue1,
                        ),
                        Text('左寄せ',style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: AppTheme.background_color,
                          activeColor: AppTheme.floating_button_color,
                          value: _value2,
                          onChanged: _setValue2,
                        ),
                        Text('右寄せ',style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 205,
                child: ElevatedButton(
                  child: const Text('席替えを実行'),
                  onPressed: () {
                    if(row>number){
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: AppTheme.background_color,
                            title: Text('不正な入力',style: Theme.of(context).textTheme.bodySmall,),
                            content: Container(
                                width: 300,
                                child: Text('横の席数に全体の人数より大きな値を設定しないでください',style: Theme.of(context).textTheme.bodyLarge,)
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
                                  onPressed: () => Navigator.popUntil(
                                      context, (route) => route.isFirst),
                                  child: Text('OK',style: Theme.of(context).textTheme.bodyLarge,),
                                ),
                              ),
                            ],
                          ),
                        );
                      return;
                    }
                    Seat seat = Seat(member, row, _value1!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(seatIn: seat)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
