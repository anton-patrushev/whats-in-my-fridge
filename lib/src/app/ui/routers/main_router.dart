import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';

class MainRouter extends StatelessWidget {
  const MainRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(child: Text('Authorized')),
        Center(
          child: CupertinoButton(
            onPressed: () {
              AuthStateProvider.of(context, listen: false).unauthenticate();
            },
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Logout')],
            ),
          ),
        )
      ]),
    );
  }
}
