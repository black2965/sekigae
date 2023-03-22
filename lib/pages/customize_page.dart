import 'package:flutter/material.dart';
import 'package:sekigae/pages/result_page.dart';
import 'package:sekigae/util/seat.dart';

class CustomizePage extends StatefulWidget {
  final List<Map<String,dynamic>> member;
  const CustomizePage({Key? key, required this.member}) : super(key: key);

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {

  late List<Map<String,dynamic>> member;
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
        appBar: AppBar(title: const Text('条件を設定')),
        body: Center(
          child: SizedBox(
            width: 300,
            child: ListView(
              children: [
                ListTile(
                  leading: const Text('人数'),
                  title: Text('$number人'),
                ),
                ListTile(
                  leading: const Text('横の席数'),
                  title: SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
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
                ListTile(
                  leading: const Text('最後列'),
                  title: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            value: _value1,
                            onChanged: _setValue1,
                          ),
                          const Text('左寄せ'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            value: _value2,
                            onChanged: _setValue2,
                          ),
                          const Text('右寄せ'),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('席替えを実行'),
                  onPressed: () {
                    Seat seat = Seat(member, row, _value1!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage(seat: seat))
                    );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}