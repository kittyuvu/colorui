import 'package:example/pages/basics/system.dart';
import 'package:example/uikit.dart';
import 'package:go_router/go_router.dart';

final $router = GoRouter(
  initialLocation: "/",// "/basic/system",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UIKit(),
    ),
    GoRoute(
      path: "/basic",
      redirect: (_, __) async {
        return "/basic/system";
      },
      routes: [
        GoRoute(
          name: "system",
          path: "system",
          builder: (context, state) => const SystemPage(),
        ),
      ],
    ),
  ],
);
