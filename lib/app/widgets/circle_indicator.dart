import 'package:flutter/material.dart';

class CircleIndicator extends Decoration {
  final Color color;
  double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircleIndicatorPainter(color: color, radius: radius);
  }

  CircleIndicator({
    required this.color,
    required this.radius,
  });
}

class _CircleIndicatorPainter extends BoxPainter {
  final Color color;
  double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    //final Offset offset1= Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius*2);
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }

  _CircleIndicatorPainter({
    required this.color,
    required this.radius,
  });
}
