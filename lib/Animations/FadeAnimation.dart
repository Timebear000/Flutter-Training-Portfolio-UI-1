import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimtaion extends StatelessWidget {
  const FadeAnimtaion({Key? key, required this.delay, required this.child})
      : super(key: key);
  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = createTween();
    return PlayAnimation<TimelineValue<Prop>>(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      child: child,
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(Prop.opacity),
          child: Transform.translate(
            offset: Offset(0.0, value.get(Prop.translateY)),
            child: child,
          ),
        );
      },
    );
  }

  TimelineTween<Prop> createTween() => TimelineTween<Prop>()
    ..addScene(
      duration: Duration(milliseconds: 500),
      begin: Duration.zero,
    ).animate(Prop.opacity, tween: Tween(begin: 0.0, end: 1.0))
    ..addScene(
      duration: Duration(milliseconds: 500),
      begin: Duration.zero,
    ).animate(Prop.translateY,
        tween: Tween(begin: 130.0, end: 0.0), curve: Curves.easeOut);
}
