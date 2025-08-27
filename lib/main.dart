import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_flix/core/router/app_router.dart';
import 'package:stream_flix/data/local_storage/shared_preference.dart';
import 'package:stream_flix/data/repos/auth_repo.dart';
import 'package:stream_flix/data/services/app_context.dart';
import 'package:stream_flix/presentation/blocs/auth/auth_bloc.dart';
import 'package:stream_flix/presentation/widgets/app_snackbar.dart';

Future<void> _firebaseInitialization() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }
}

Future<void> _intializeLocalStorage() async {
  await LocalStorage.initialize();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebaseInitialization();
  await _intializeLocalStorage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepo.instance),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.route,
        title: 'My Flutter App',
        scaffoldMessengerKey: AppSnackbar.scaffoldMessengerKey,
        builder: (context, child) {
          AppContext.init(context);
          return child!;
        },
      ),
    );
  }
}
