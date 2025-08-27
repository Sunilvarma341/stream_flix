import 'package:flutter/material.dart';

class PScaffold extends StatelessWidget {
  const PScaffold({super.key, this.body, this.appBar});
  final Widget? body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: body);
  }
}
