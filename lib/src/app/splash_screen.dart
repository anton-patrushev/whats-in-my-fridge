import 'package:flutter/material.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = AuthStateProvider.of(context);

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(authState.isAuthenticated ? "Authenticated" : "Unauthenticated"),
          ElevatedButton(
              onPressed: () {
                if (authState.isAuthenticated) {
                  authState.unauthenticate();
                } else {
                  authState.authenticate();
                }
              },
              child: Text('Press to trigger authentication action'))
        ]),
      ),
    );
  }
}
