import 'package:example/pages/basics/system.dart';
import 'package:example/pages/basics/theme.dart';
import 'package:example/uikit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouterWidgetBuilder $noop = (context, state) => const SizedBox.shrink();

final $router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UIKit(),
    ),
    GoRoute(
      path: "/basic",
      builder: $noop,
      routes: [
        GoRoute(
          name: "system",
          path: "system",
          builder: (context, state) => const SystemPage(),
        ),
        GoRoute(
          name: "theme",
          path: "theme",
          builder: (context, state) => const ThemePage(),
        ),
      ],
    ),
  ],
);
