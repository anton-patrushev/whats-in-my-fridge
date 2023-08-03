import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state.dart';
// import 'package:whats_in_my_fridge/src/shared/core/errors/debug/missing_context_exception.dart';

class AuthStateProvider {
  const AuthStateProvider();

  static AuthState of(BuildContext context, {bool listen = true}) =>
      Provider.of<AuthState>(context, listen: listen);

  static AuthState ofWithNoListen(BuildContext context) =>
      Provider.of<AuthState>(context, listen: false);

  static ChangeNotifierProvider<AuthState> create() {
    return ChangeNotifierProvider(
      create: (context) => AuthState(),
    );
  }
}
