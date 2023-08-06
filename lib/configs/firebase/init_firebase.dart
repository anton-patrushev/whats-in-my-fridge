import 'package:firebase_core/firebase_core.dart';

import 'package:whats_in_my_fridge/configs/firebase/firebase_options.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
