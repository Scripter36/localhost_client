import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteBuilders {
  static Route<dynamic> sharedAxisTransition(Widget page, SharedAxisTransitionType type,
      {Duration transitionDuration = const Duration(milliseconds: 300),
      Duration reverseTransitionDuration = const Duration(milliseconds: 300),
      RouteSettings? settings}) {
    return Platform.isAndroid
        ? PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) => SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: type,
              child: child,
            ),
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            settings: settings,
          )
        : CupertinoPageRoute<dynamic>(builder: (context) => page, settings: settings);
  }

  static Route<dynamic> fadeThroughTransition(Widget page,
      {Duration transitionDuration = const Duration(milliseconds: 300),
      Duration reverseTransitionDuration = const Duration(milliseconds: 300),
      RouteSettings? settings}) {
    return Platform.isAndroid
        ? PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            settings: settings,
          )
        : CupertinoPageRoute<dynamic>(builder: (context) => page, settings: settings);
  }
}
