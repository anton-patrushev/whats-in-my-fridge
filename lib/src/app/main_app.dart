import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:whats_in_my_fridge/src/app/splash_screen.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: "What's in my fridge",
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
        home: SplashScreen());
  }
}

class AppWithGlobalContexts extends StatelessWidget {
  const AppWithGlobalContexts({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [AuthStateProvider.create()], child: child);
  }
}
