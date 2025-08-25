import 'package:go_router/go_router.dart';
import 'package:stream_flix/core/router/page.dart';
import 'package:stream_flix/presentation/screens/home_screen.dart';

class AppRouter {
  AppRouter._();
  static GoRouter get route => _router;
  static final GoRouter _router = GoRouter(
    initialLocation: PAGE.home.path,
    routes: [
      GoRoute(
        path: PAGE.home.path,
        name: PAGE.home.name,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
