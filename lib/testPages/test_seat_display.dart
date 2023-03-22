import 'package:sekigae/ui/seat_table.dart';
import 'package:sekigae/util/seat.dart';

import 'package:flutter/material.dart';

class SeatDisplay extends StatefulWidget {
  @override
  State<SeatDisplay> createState() => _SeatDisplayState();
}

class _SeatDisplayState extends State<SeatDisplay> {
  final List<Map<String, dynamic>> roster = [];
  late final SeatTable table;

  @override
  void initState() {
    super.initState();
    //Create roster
    for (int i = 0; i < 24; i++) {
      Map<String, dynamic> map = {
        "number": i + 1,
        "name": i.toString(),
        "front": false,
      };
      roster.add(map);
    }
    //Create seat instance
    Seat seat = Seat(roster, 5, false);
    table = SeatTable(height: 400, width: 300, seat: seat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("座席表 表示テスト"),
        ),
        body: Center(
          child: table,
        ));
  }
}
