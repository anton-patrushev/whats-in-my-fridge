import 'package:flutter/cupertino.dart';

class FridgesList extends StatelessWidget {
  const FridgesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfFridges = [1];

    final noFridgesYet = listOfFridges.isEmpty;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('L'),
        middle: Text('M'),
        trailing: Text('T'),
      ),
      child: SafeArea(
          child: noFridgesYet
              ? const _FridgesListEmptyPlaceholder()
              : const _FridgesList()),
    );
  }
}

class _FridgesListEmptyPlaceholder extends StatelessWidget {
  const _FridgesListEmptyPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Flexible(flex: 1, child: Text('No Fridges yet'))],
    );
  }
}

class _FridgesList extends StatelessWidget {
  const _FridgesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Flexible(flex: 1, child: Text('List of Fridges'))],
    );
  }
}
