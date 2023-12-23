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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TempScreen()));
            },
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Open Temp Screen')],
            ),
          ),
        )
      ]),
    );
  }
}

class TempScreen extends StatelessWidget {
  TempScreen({super.key, this.depth = 0});

  int depth = 0;

  @override
  Widget build(BuildContext context) {
    // todo: calculate label (depth === 3 ? 'log out' : 'go deeper')
    // todo: assign different onPress (depth === 3 ? logout : openMainRouter)

    final actionLabel = depth == 3 ? 'Log Out' : 'Go Deeper';
    final action = depth == 3
        ? () {
            AuthStateProvider.of(context, listen: false).unauthenticate();
          }
        : () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TempScreen(
                      depth: depth + 1,
                    )));
          };

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: CupertinoButton(
            onPressed: action,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(actionLabel)],
            ),
          ),
        )
      ]),
    );
  }
}
