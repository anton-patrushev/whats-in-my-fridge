import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:whats_in_my_fridge/configs/environment/environment_config.dart';
import 'package:whats_in_my_fridge/configs/firebase/firebase_options.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (Enviroment.config.isDebug) {
    print("isDebug: ${Enviroment.config.isDebug}");

    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
}
