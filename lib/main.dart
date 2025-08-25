import 'package:flutter/material.dart';
import 'package:stream_flix/core/router/app_router.dart';

void main() {
  runApp(MyApp());
}

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.route.routeInformationProvider,
      routeInformationParser: AppRouter.route.routeInformationParser,
      routerDelegate: AppRouter.route.routerDelegate,
      title: 'My Flutter App',
      scaffoldMessengerKey: scaffoldMessengerKey,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
