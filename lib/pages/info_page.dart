import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("このアプリの情報"),
        ),
        body: Center(
          child: Container(
            width: 700,
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.apps),
                    title: Text('アプリ名'),
                    subtitle: Text('席替え侍'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.verified),
                    title: Text('バージョン'),
                    subtitle: Text('開発版'),
                  ),
                ),
                Card(
                  child: ListTile(
                      onTap: () async {
                        if (await canLaunchUrlString(
                            "https://www.gnu.org/licenses/gpl-3.0.html")) {
                          await launchUrlString(
                              "https://www.gnu.org/licenses/gpl-3.0.html");
                        }
                      },
                      leading: Icon(Icons.book),
                      title: Text('このアプリのライセンス'),
                      subtitle:
                          Text('GNU General Public License v3.0 or later'),
                      trailing: Icon(Icons.navigate_next)),
                ),
                SizedBox(height: 20),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('開発者集団『みかんさん』'),
                    subtitle: Text('Xkuroiwa noriox 小山田純'),
                  ),
                ),
                Card(
                  child: ListTile(
                      onTap: () async {
                        if (await canLaunchUrlString("https://mican3.github.io/sekigae.html")) {
                          await launchUrlString("https://mican3.github.io/sekigae.html");
                        }
                      },
                      leading: Icon(Icons.home),
                      title: Text('ホームページ'),
                      subtitle: Text('https://mican3.github.io/sekigae.html'),
                      trailing: Icon(Icons.open_in_new)),
                ),
                Card(
                  child: ListTile(
                      onTap: () async{
                        if (await canLaunchUrlString("https://github.com/sis314/sekigae")) {
                        await launchUrlString("https://github.com/sis314/sekigae");
                        }
                      },
                      leading: Icon(Icons.code),
                      title: Text('ソースコード(Github)'),
                      subtitle: Text('https://github.com/sis314/sekigae'),
                      trailing: Icon(Icons.open_in_new)),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: ListTile(
                      onTap: () {
                        showLicensePage(
                          context: context,
                          applicationName: '席替え侍',
                          applicationVersion: '開発版',
                          applicationIcon: FlutterLogo(),
                          applicationLegalese:
                              'GNU General Public License v3.0 or later',
                        );
                      },
                      leading: Icon(Icons.code),
                      title: Text('使用したライブラリー'),
                      subtitle: Text(''),
                      trailing: Icon(Icons.navigate_next)),
                ),
              ],
            ),
          ),
        ));
  }
}
