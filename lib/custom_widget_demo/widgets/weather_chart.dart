import 'package:flutter/material.dart';

class WeatherChart extends StatelessWidget {
  final List<double> temperatures;

  const WeatherChart({super.key, required this.temperatures});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CustomPaint(
        painter: _WeatherChartPainter(temperatures),
      ),
    );
  }
}

class _WeatherChartPainter extends CustomPainter {
  final List<double> temperatures;

  _WeatherChartPainter(this.temperatures);

  @override
  void paint(Canvas canvas, Size size) {
    if (temperatures.isEmpty) return;

    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final pointPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final path = Path();
    final width = size.width;
    final height = size.height;

    // 计算极值用于归一化
    final maxTemp = temperatures.reduce((a, b) => a > b ? a : b);
    final minTemp = temperatures.reduce((a, b) => a < b ? a : b);
    final tempRange = maxTemp - minTemp;
    
    // 避免除以0
    final range = tempRange == 0 ? 1 : tempRange;

    final stepX = width / (temperatures.length - 1);

    for (int i = 0; i < temperatures.length; i++) {
      final temp = temperatures[i];
      // 归一化Y坐标 (注意Canvas坐标系Y向下为正，所以需要翻转)
      // height * 0.8 是为了留出底部padding
      final normalizedTemp = (temp - minTemp) / range;
      final x = i * stepX;
      // 这里的计算：temp越高，y越小（靠上）
      final y = height - (normalizedTemp * height * 0.7 + height * 0.15);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // 绘制点
      canvas.drawCircle(Offset(x, y), 5, pointPaint);
      // 绘制内圈白点
      canvas.drawCircle(Offset(x, y), 2, Paint()..color = Colors.white);

      // 绘制文字
      textPainter.text = TextSpan(
        text: "${temp.toInt()}°",
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - 20));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 简单起见，总是重绘
  }
}
