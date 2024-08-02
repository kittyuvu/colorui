import 'dart:ui';

import 'package:example/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UIExample());
}

class UIExample extends StatelessWidget {
  const UIExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UI Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: DragonScrollBehavior(),
      routerConfig: $router,
    );
  }
}

class DragonScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
