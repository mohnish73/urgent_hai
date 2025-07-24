import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';

class CustomBounce extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomBounce({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Bounce(child: child, duration: bounceduration, onTap: onPressed);
  }
}

const Duration bounceduration = Duration(milliseconds: 110);
