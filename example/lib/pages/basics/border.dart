import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

class BorderPage extends StatefulWidget {
  const BorderPage({super.key});

  @override
  State<BorderPage> createState() => _BorderPageState();
}

class _BorderPageState extends State<BorderPage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "边框"),
        body: Padding(
          padding: 12.$edgeAll,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CuAction.text("边框尺寸"),
                hSpacing,
                const Text("Flutter 中默认就支持边框, 或许可以写扩展来简单化这部分")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
