import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_in_my_fridge/src/app/ui/routers/main_router.dart';

import 'package:whats_in_my_fridge/src/authentication/services/authorization/sso/apple_authentication_service.dart';
import 'package:whats_in_my_fridge/src/authentication/services/authorization/sso/google_authentication_service.dart';

import 'package:whats_in_my_fridge/src/authentication/ui/widgets/sso_auth_button.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  void navigateToMainRouter(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainRouter()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SSOAuthButton(
                onPress: () async {
                  try {
                    await GoogleAuthenticationService().authorize();

                    navigateToMainRouter(context);
                  } catch (error) {
                    print(error);
                    // TODO: alert error
                  }
                },
                icon: Ionicons.logo_google,
                label: 'Continue using Google account',
                color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SSOAuthButton(
                onPress: () async {
                  try {
                    await AppleAuthenticationService().authorize();

                    navigateToMainRouter(context);
                  } catch (error) {
                    print(error);
                    // TODO: alert error
                  }
                },
                icon: Ionicons.logo_apple,
                label: 'Continue using Apple account',
                color: Colors.black),
          )
        ],
      ),
    ));
  }
}
