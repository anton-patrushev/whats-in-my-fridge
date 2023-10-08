import 'package:flutter/material.dart';
import 'package:whats_in_my_fridge/src/app/ui/routers/main_router.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';
import 'package:whats_in_my_fridge/src/authentication/services/authorization/session/session_service.dart';
import 'package:whats_in_my_fridge/src/authentication/ui/screens/sign_in_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool appLoadingFinished = false;

  void loadApp() async {
    // TODO: make some initial API or SDK calls to init the app
    // TODO: add logic to handle app loading failed

    try {
      await SessionService().refreshSession();
    } catch (e) {
      // TODO: better logging
      print(e);
    }

    setState(() {
      appLoadingFinished = true;
    });

    proceedToTheApp();
  }

  void proceedToTheApp() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final authState = AuthStateProvider.of(context, listen: false);

      if (authState.isAuthenticated) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainRouter()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInUp()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    loadApp();
  }

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: add app logo
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('Loading ...'))],
    ));
  }
}
