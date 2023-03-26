import 'package:flutter/material.dart';
import 'package:sekigae/pages/export_page.dart';
import 'package:sekigae/pages/guide_page.dart';
import 'package:sekigae/pages/home_page.dart';
import 'package:sekigae/pages/info_page.dart';
import 'package:sekigae/pages/result_page.dart';
import 'package:sekigae/pages/customize_page.dart';
import 'package:sekigae/testPages/test_seat_display.dart';
import 'package:sekigae/util/seat.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("テスト用ページ"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("テストページ"),
            TextButton(
              child: const Text("Home Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            TextButton(
              child: const Text("Customize page"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomizePage(member: [])));
              },
            ),
            TextButton(
              child: const Text("Result Page"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              seatIn: Seat([
                                {
                                  "number": 1,
                                  "name": "a",
                                  "front": false,
                                }
                              ], 1, false),
                            )));
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text("Guide Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GuidePage()));
              },
            ),

            TextButton(
              child: const Text("Info Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InfoPage()));
              },
            ),

            TextButton(
              child: const Text("Export Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ExportPage()));
              },
            ),

            //! ここからデバッグ用ページ
            const SizedBox(
              height: 30,
            ),
            const Text("ここからデバッグ用ページ"),
            TextButton(
              child: const Text("test_seat_display Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeatDisplay()));
              },
            ),

            // TextButton(
            //   child: const Text("Result Page"),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => ResultPage()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
