import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';

import 'package:whats_in_my_fridge/src/authentication/services/apple_authentication_service.dart';
import 'package:whats_in_my_fridge/src/authentication/services/google_authentication_service.dart';

import 'package:whats_in_my_fridge/src/authentication/ui/widgets/sso_auth_button.dart';

class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  void Function() signInWighGoogle(AuthState authState) => () async {
        try {
          var token = await GoogleAuthenticationService.shared.authorize();

          authState.authenticate(token: token);
        } catch (error) {
          // TODO: alert error
        }
      };

  void Function() signInWighApple(AuthState authState) => () async {
        try {
          var token = await AppleAuthenticationService.shared.authorize();

          authState.authenticate(token: token);
        } catch (error) {
          // TODO: alert error
        }
      };

  @override
  Widget build(BuildContext context) {
    final authState = AuthStateProvider.of(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SSOAuthButton(
                onPress: signInWighGoogle(authState),
                icon: Ionicons.logo_google,
                label: 'Continue using Google account',
                color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SSOAuthButton(
                onPress: signInWighApple(authState),
                icon: Ionicons.logo_apple,
                label: 'Continue using Apple account',
                color: Colors.black),
          )
        ],
      ),
    ));
  }
}
