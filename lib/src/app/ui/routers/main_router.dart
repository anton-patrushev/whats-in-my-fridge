import 'package:flutter/material.dart';

class MainRouter extends StatelessWidget {
  const MainRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text('Authorized'))]),
    );
  }
}
