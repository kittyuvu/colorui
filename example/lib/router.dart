import 'package:colorui/colorui.dart';
import 'package:example/pages/basics/background.dart';
import 'package:example/pages/basics/border.dart';
import 'package:example/pages/basics/icons.dart';
import 'package:example/pages/basics/navbar.dart';
import 'package:example/pages/basics/shadow.dart';
import 'package:example/pages/basics/system.dart';
import 'package:example/pages/basics/tabbar.dart';
import 'package:example/pages/basics/text.dart';
import 'package:example/pages/basics/theme.dart';
import 'package:example/uikit.dart';
import 'package:go_router/go_router.dart';

GoRouterWidgetBuilder $noop = (context, state) => nil;

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
        GoRoute(
          name: "navbar",
          path: "navbar",
          builder: (context, state) => const NavbarPage(),
        ),
        GoRoute(
          name: "tabbar",
          path: "tabbar",
          builder: (context, state) => const TabbarPage(),
        ),
        GoRoute(
          name: "background",
          path: "background",
          builder: (context, state) => const BackgroundPage(),
        ),
        GoRoute(
          name: "text",
          path: "text",
          builder: (context, state) => const TextPage(),
        ),
        GoRoute(
          name: "icons",
          path: "icons",
          builder: (context, state) => const IconsPage(),
        ),
        GoRoute(
          name: "shadow",
          path: "shadow",
          builder: (context, state) => const ShadowPage(),
        ),
        GoRoute(
          name: "border",
          path: "border",
          builder: (context, state) => const BorderPage(),
        ),
      ],
    ),
  ],
);
