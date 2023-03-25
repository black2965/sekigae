import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../app_theme.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.background_color,
        appBar: AppBar(
          backgroundColor:AppTheme.app_bar_color ,
          title: const Text("このアプリの情報"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Container(
              width: 700,
              child: ListView(
                children: [
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.apps),
                      title: Text('アプリ名'),
                      subtitle: Text('席替え侍'),
                    ),
                  ),
                  const Card(
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
                        leading: const Icon(Icons.book),
                        title: const Text('このアプリのライセンス'),
                        subtitle:
                            const Text('GNU General Public License v3.0 or later'),
                        trailing: const Icon(Icons.navigate_next)),
                  ),
                  const SizedBox(height: 20),
                  const Card(
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
                        leading: const Icon(Icons.home),
                        title: const Text('ホームページ'),
                        subtitle: const Text('https://mican3.github.io/sekigae.html'),
                        trailing: const Icon(Icons.open_in_new)),
                  ),
                  Card(
                    child: ListTile(
                        onTap: () async{
                          if (await canLaunchUrlString("https://github.com/sis314/sekigae")) {
                          await launchUrlString("https://github.com/sis314/sekigae");
                          }
                        },
                        leading: const Icon(Icons.code),
                        title: const Text('ソースコード(Github)'),
                        subtitle: const Text('https://github.com/sis314/sekigae'),
                        trailing: const Icon(Icons.open_in_new)),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: ListTile(
                        onTap: () {
                          showLicensePage(
                            context: context,
                            applicationName: '席替え侍',
                            applicationVersion: '1.0',
                            applicationIcon: const ImageIcon(
                              AssetImage('/assets/icon/icon.png'),
                            ),
                            applicationLegalese:
                                'GNU General Public License v3.0 or later',
                          );
                        },
                        leading: const Icon(Icons.code),
                        title: const Text('使用したライブラリー'),
                        subtitle: const Text(''),
                        trailing: const Icon(Icons.navigate_next)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
