import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      context: context,
      child: const Scaffold(
        appBar: CuNavbar(title: "系统"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CuAction(title: "简介"),
                SizedBox(
                  height: 6,
                ),
                Text("TODOOOOO"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
