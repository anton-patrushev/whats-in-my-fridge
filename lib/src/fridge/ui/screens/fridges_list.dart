import 'package:flutter/cupertino.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.provider.dart';
import 'package:whats_in_my_fridge/src/authentication/ui/screens/sign_in_up.dart';
import 'package:whats_in_my_fridge/src/fridge/data/remote/fridge/fridge_repository.dart';
import 'package:whats_in_my_fridge/src/fridge/models/fridge.dart';

class FridgesList extends StatelessWidget {
  const FridgesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = AuthStateProvider.of(context);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Fridges'),
          leading: CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              FridgeRepository(currentUserUUID: authState.currentUserUUID)
                  .createFridge(
                      input: const CreateFridgeInput(
                          name: 'Test 1', model: 'Model 2'));
            },
            child: const Text('Test'),
          ),
          trailing: CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              authState.unauthenticate();
              Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (context) => const SignInUp()));
            },
            child: const Text('Logout'),
          ),
        ),
        child: SafeArea(
            child: StreamBuilder(
                stream:
                    FridgeRepository(currentUserUUID: authState.currentUserUUID)
                        .subscribeToUserFridges(),
                builder: (context, snapshot) {
                  final fridges = snapshot.data;

                  if (fridges == null) {
                    return const _FridgesListEmptyPlaceholder();
                  }

                  return _FridgesList(fridges: fridges);
                })));
  }
}

class _FridgesListEmptyPlaceholder extends StatelessWidget {
  const _FridgesListEmptyPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Flexible(flex: 1, child: Text('No Fridges yet'))],
    );
  }
}

class _FridgesList extends StatelessWidget {
  const _FridgesList({required this.fridges});

  final List<FridgeEntity> fridges;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fridges.length,
      itemBuilder: (context, index) {
        final item = fridges[index];
        return CupertinoListTile(
          title: Text(item.name),
          subtitle: Text(item.model),
        );
      },
    );
  }
}
