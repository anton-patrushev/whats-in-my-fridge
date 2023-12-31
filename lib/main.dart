import 'package:flutter/widgets.dart';
import 'package:whats_in_my_fridge/configs/environment/environment_config.dart';

import 'package:whats_in_my_fridge/src/app/main_app.dart';
import 'package:whats_in_my_fridge/configs/firebase/init_firebase.dart';

void main() async {
  await Environment.init();
  Environment.buildConfig();

  WidgetsFlutterBinding.ensureInitialized();

  await initFirebase();

  runApp(const AppWithGlobalContexts(child: MainApp()));
}
