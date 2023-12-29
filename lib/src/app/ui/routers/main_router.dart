import 'package:flutter/cupertino.dart';
import 'package:whats_in_my_fridge/src/fridge/ui/screens/fridges_list.dart';

class MainRouter extends StatelessWidget {
  const MainRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text('Welcome to', style: TextStyle(fontSize: 18)),
                    Text("What's in my Fridge",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ]))),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Center(
                  child: CupertinoButton.filled(
                onPressed: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => const FridgesList()));
                },
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text('Continue'),
              )))
        ],
      ),
    ));
  }
}
