import 'package:flutter/material.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({Key? key}) : super(key: key);

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("条件の設定"),
      ),
      body: const Center(
          child: Text("条件の設定")
      ),
    );
  }
}
