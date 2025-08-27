import 'package:go_router/go_router.dart';
import 'package:stream_flix/core/router/page.dart';
import 'package:stream_flix/presentation/screens/home_screen.dart';
import 'package:stream_flix/presentation/screens/login_screen.dart';
import 'package:stream_flix/presentation/screens/splash_screen.dart/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static GoRouter get route => _router;
  static final GoRouter _router = GoRouter(
    initialLocation: PAGE.splash.path,
    routes: [
      GoRoute(
        path: PAGE.home.path,
        name: PAGE.home.name,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: PAGE.login.path,
        name: PAGE.login.name,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: PAGE.splash.path,
        name: PAGE.splash.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );
}
