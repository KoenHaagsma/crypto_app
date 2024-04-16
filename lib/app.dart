import 'package:crypto_app/features/overview/presentation/detail_page.dart';
import 'package:crypto_app/features/overview/presentation/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const OverviewPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'crypto/:name',
          builder: (context, state) => const DetailPage(),
        ),
      ],
    ),
  ],
);

final ThemeData _themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(100, 28, 28, 28),
    foregroundColor: Colors.white,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.orange,
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
    background: const Color.fromARGB(255, 35, 35, 35),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    subtitleTextStyle: TextStyle(
      color: Colors.white24,
      fontSize: 12,
    ),
  ),
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto App',
      theme: _themeData,
      routerConfig: _router,
    );
  }
}
