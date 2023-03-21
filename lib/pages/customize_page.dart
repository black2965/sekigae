import 'package:flutter/material.dart';

class CustomizePage extends StatefulWidget {
  final List member;
  const CustomizePage({Key? key, required this.member}) : super(key: key);

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {

  late List member;
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
        appBar: AppBar(title: Text('設定画面')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('人数 $number人'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('横数'),
                SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,

                    onChanged: (text) {
                      setState(() {
                        row = int.tryParse(text) ?? 0;
                        print(row);
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('最後列'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            value: _value1,
                            onChanged: _setValue1,
                          ),
                          Text('左寄せ'),
                        ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                          value: _value2,
                          onChanged: _setValue2,
                        ),
                        Text('右寄せ'),
                      ],
                    ),

                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('席替え実行'),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}