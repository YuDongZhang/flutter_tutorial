import 'package:flutter/material.dart';
import 'dart:math' as math;

class WatermarkWidget extends StatelessWidget {
  final Widget child;
  final String watermarkText;
  final int rowCount;
  final int colCount;

  const WatermarkWidget({
    super.key,
    required this.child,
    this.watermarkText = "CONFIDENTIAL",
    this.rowCount = 3,
    this.colCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          // 确保水印不拦截点击事件
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(rowCount, (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(colCount, (col) {
                    return Transform.rotate(
                      angle: -math.pi / 6, // 旋转 -30度
                      child: Text(
                        watermarkText,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.15),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
