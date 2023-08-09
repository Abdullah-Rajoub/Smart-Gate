import 'package:flutter/material.dart';

class CustomShapeBorder extends ShapeBorder {
  const CustomShapeBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + 20, rect.top)
      ..lineTo(rect.right - 20, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + 20),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.right, rect.bottom - 20)
      ..arcToPoint(
        Offset(rect.right - 20, rect.bottom),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.left + 20, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - 20),
        radius: const Radius.circular(20),
      )
      ..lineTo(rect.left, rect.top + 20)
      ..arcToPoint(
        Offset(rect.left + 20, rect.top),
        radius: const Radius.circular(20),
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
