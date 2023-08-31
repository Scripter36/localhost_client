import 'package:flutter/material.dart';

class RectCurveTween extends RectTween {
  final Curve curve;
  RectCurveTween({super.begin, super.end, this.curve = Curves.linear});

  @override
  Rect? lerp(double t) => Rect.lerp(begin, end, curve.transform(t));
}

// This tween separates translate and scale. translate follows curve, scale follows reverse curve ( 1 - curve(1 - t) )
class RectCurveSeparateTween extends RectCurveTween {
  RectCurveSeparateTween({super.begin, super.end, super.curve});

  @override
  Rect? lerp(double t) {
    var curveValue = curve.transform(t);
    var reverseCurveValue = 1 - curve.transform(1 - t);

    var beginCenter = begin!.center;
    var endCenter = end!.center;
    var beginXSize = begin!.width;
    var endXSize = end!.width;
    var beginYSize = begin!.height;
    var endYSize = end!.height;

    var xSize = beginXSize + (endXSize - beginXSize) * reverseCurveValue;
    var ySize = beginYSize + (endYSize - beginYSize) * reverseCurveValue;
    var x = beginCenter.dx + (endCenter.dx - beginCenter.dx) * curveValue;
    var y = beginCenter.dy + (endCenter.dy - beginCenter.dy) * curveValue;

    return Rect.fromCenter(center: Offset(x, y), width: xSize, height: ySize);
  }
}
