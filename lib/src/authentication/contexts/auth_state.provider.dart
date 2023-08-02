import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.dart';
// import 'package:whats_in_my_fridge/src/shared/core/errors/debug/missing_context_exception.dart';

class AuthStateProvider extends StatelessWidget {
  const AuthStateProvider({super.key, required this.child});

  final Widget child;

  static AuthState of(BuildContext context) => Provider.of<AuthState>(context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthState(),
      child: child,
    );
  }
}
