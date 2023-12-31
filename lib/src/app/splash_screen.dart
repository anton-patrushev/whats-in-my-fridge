import 'package:flutter/cupertino.dart';
import 'package:whats_in_my_fridge/src/app/ui/routers/main_router.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';
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

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      appLoadingFinished = true;
    });
  }

  void proceedToTheApp() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (AuthStateProvider.of(context, listen: false).isAuthenticated) {
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => const MainRouter()));
      } else {
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => const SignInUp()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    loadApp();
  }

  void proceedToTheAppIfAuthStateInitializedAndAppLoaded() {
    if (!appLoadingFinished) return;
    if (!AuthStateProvider.of(context).wasAuthStateInitialized) return;

    proceedToTheApp();
  }

  @override
  Widget build(BuildContext context) {
    proceedToTheAppIfAuthStateInitializedAndAppLoaded();

    return const CupertinoPageScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('Loading ...'))],
    ));
  }
}
