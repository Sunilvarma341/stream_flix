import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:stream_flix/core/router/app_router.dart';
import 'package:stream_flix/core/router/page.dart';
import 'package:stream_flix/data/local_storage/shared_preference.dart';
import 'package:stream_flix/data/models/user_model.dart';

class AppContext {
  AppContext._();
  static BuildContext? _context;
  static BuildContext get context {
    if (_context == null) {
      throw Exception(
        "AppContext is not initialized. Call AppContext.init(context) first.",
      );
    }
    return _context!;
  }

  static void init(BuildContext context) {
    _context = context;
  }

  static GoRouter get router => AppRouter.route;

  static void initiaNavigation() {
    final UserModel? userModel = LocalStorage.getUser();
    if (userModel != null) {
      router.go(PAGE.home.path);
    } else {
      router.go(PAGE.login.path);
    }
  }
}
