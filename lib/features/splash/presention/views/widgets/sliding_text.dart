import 'package:flutter/material.dart';

class slidingtext extends StatelessWidget {
  const slidingtext({super.key, required this.slidinganimation});

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidinganimation,
          child: const Text('Boooky App', textAlign: TextAlign.center),
        );
      },
    );
  }
}
