import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:whats_in_my_fridge/firebase_options.dart';
import 'package:whats_in_my_fridge/src/app/main_app.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppWithGlobalContexts(child: MainApp()));
}
