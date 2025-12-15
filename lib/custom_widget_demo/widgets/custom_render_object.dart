import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShadowBox extends SingleChildRenderObjectWidget {
  final double distance;
  final Color color;

  const ShadowBox({
    super.key,
    super.child,
    this.distance = 8.0,
    this.color = Colors.grey,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(
      distance: distance,
      shadowColor: color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject
      ..distance = distance
      ..shadowColor = color;
  }
}

class RenderShadowBox extends RenderProxyBox {
  double _distance;
  Color _shadowColor;

  RenderShadowBox({
    required double distance,
    required Color shadowColor,
    RenderBox? child,
  })  : _distance = distance,
        _shadowColor = shadowColor,
        super(child);

  double get distance => _distance;
  set distance(double value) {
    if (_distance != value) {
      _distance = value;
      markNeedsPaint();
    }
  }

  Color get shadowColor => _shadowColor;
  set shadowColor(Color value) {
    if (_shadowColor != value) {
      _shadowColor = value;
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      // 1. 绘制阴影
      // 我们在稍稍偏移的位置绘制 Child 的"影子"
      // 为了简单演示，我们直接绘制一个与 Child 大小相同的矩形作为阴影
      final Paint shadowPaint = Paint()
        ..color = _shadowColor
        ..style = PaintingStyle.fill;
      
      context.canvas.drawRect(
        (offset + Offset(_distance, _distance)) & child!.size,
        shadowPaint,
      );

      // 2. 绘制 Child 本身
      context.paintChild(child!, offset);
    }
  }
}
