import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///关闭过场动画
class NoPageTransition extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    return child;
  }
}
