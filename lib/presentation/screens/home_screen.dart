import 'package:flutter/material.dart';
import 'package:stream_flix/presentation/widgets/p_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PScaffold(body: Center(child: Text('Home Screen')));
  }
}
