import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteBuilders {
  static Route<dynamic> sharedAxisTransition(
      Widget page, SharedAxisTransitionType type) {
    return Platform.isAndroid
        ? PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: type,
              child: child,
            ),
          )
        : CupertinoPageRoute<dynamic>(
            builder: (context) => page,
          );
  }

  static Route<dynamic> fadeThroughTransition(Widget page) {
    return Platform.isAndroid
        ? PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
          )
        : CupertinoPageRoute<dynamic>(
            builder: (context) => page,
          );
  }
}
