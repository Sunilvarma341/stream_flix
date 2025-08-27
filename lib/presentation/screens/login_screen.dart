import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stream_flix/core/router/page.dart';
import 'package:stream_flix/data/repos/auth_repo.dart';
import 'package:stream_flix/presentation/blocs/auth/auth_bloc.dart';
import 'package:stream_flix/presentation/blocs/auth/auth_event.dart';
import 'package:stream_flix/presentation/blocs/auth/auth_state.dart';
import 'package:stream_flix/presentation/widgets/app_snackbar.dart';
import 'package:stream_flix/presentation/widgets/custome_text_field.dart';
import 'package:stream_flix/presentation/widgets/p_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    AuthRepo.instance.initializeGoogleSignIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go(PAGE.home.path);
        } else if (state is Unauthenticated) {
          log(state.message ?? "Auth failed");
          // AppSnackbar.show(state.message ?? "Auth failed");
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return PScaffold(
          appBar: AppBar(title: const Text('Login'), centerTitle: true),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomeTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    controller: TextEditingController(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomeTextFormField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    controller: TextEditingController(),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      bloc.add(GoogleSignInRequested());
                    },
                    child: const Text(
                      'Google Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(
                          SignInRequested(
                            emailController.text,
                            passwordController.text,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
