import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  String? title = "自定义标题";
  String? backText;

  var $title = TextEditingController();
  var $backText = TextEditingController();

  @override
  void initState() {
    $title.addListener(() {
      title = $title.text;
      setState(() {});
    });
    $backText.addListener(() {
      backText = $backText.text;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    $title.dispose();
    $backText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
          appBar: const CuNavbar(titleText: "导航栏"),
          body: SingleChildScrollView(
            child: Padding(
              padding: 12.$edgeAll,
              child: Column(
                children: [
                  const CuTitle(title: "使用指南"),
                  hSpacing,
                  Column(
                    children: [
                      CuNavbar(titleText: title, backTitle: backText),
                      hSpacing,
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration:
                                  const InputDecoration(hintText: "自定义标题"),
                              controller: $title,
                            ),
                          ),
                          wSpacing,
                          Expanded(
                            child: TextField(
                              decoration:
                                  const InputDecoration(hintText: "自定义返回文本"),
                              controller: $backText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
