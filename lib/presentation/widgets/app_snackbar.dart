import 'package:flutter/material.dart';

class AppSnackbar {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void show(String msg) {
    final state = scaffoldMessengerKey.currentState;
    if (state != null && state.mounted) {
      state.showSnackBar(SnackBar(content: Text(msg)));
    }
  }
}
