import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SSOAuthButton extends StatelessWidget {
  const SSOAuthButton(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.label,
      this.color = Colors.blue});

  final VoidCallback? onPress;
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.only(right: 20), child: Icon(icon)),
          Text(label)
        ],
      ),
    );
  }
}
