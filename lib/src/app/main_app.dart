import 'package:flutter/material.dart';
import 'package:whats_in_my_fridge/src/app/splash_screen.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "What's in my fridge",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
        home: const _AppWithGlobalContexts(
          child: SplashScreen(),
        ));
  }
}

class _AppWithGlobalContexts extends StatelessWidget {
  const _AppWithGlobalContexts({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuthStateProvider(child: child);
  }
}
