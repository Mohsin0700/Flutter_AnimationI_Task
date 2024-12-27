import 'package:flutter/widgets.dart';

class TweenAnimationWidget extends StatelessWidget {
  final double start;
  final double end;
  final int periodInMilliSeconds;
  final Widget child;

  const TweenAnimationWidget(
      {super.key,
      required this.start,
      required this.end,
      required this.periodInMilliSeconds,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: start, end: end),
      duration: Duration(milliseconds: periodInMilliSeconds),
      builder: (context, value, child) {
        return child!;
      },
    );
  }
}
