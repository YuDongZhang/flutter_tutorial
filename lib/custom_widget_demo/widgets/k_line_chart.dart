import 'package:flutter/material.dart';
import 'dart:math';

class KLineData {
  final DateTime time;
  final double open;
  final double high;
  final double low;
  final double close;

  KLineData({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}

class KLineChart extends StatelessWidget {
  final List<KLineData> data;
  final double height;

  const KLineChart({
    super.key,
    required this.data,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.black87, // 深色背景，常用于股票软件
      child: CustomPaint(
        size: Size.infinite,
        painter: _KLinePainter(data),
      ),
    );
  }
}

class _KLinePainter extends CustomPainter {
  final List<KLineData> data;
  final double candleWidth;
  final double candleSpacing;

  _KLinePainter(this.data)
      : candleWidth = 8.0,
        candleSpacing = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    // 1. 计算Y轴范围
    double maxPrice = data.map((e) => e.high).reduce(max);
    double minPrice = data.map((e) => e.low).reduce(min);
    
    // 给上下留一点缓冲
    final priceRange = maxPrice - minPrice;
    final paddingRange = priceRange * 0.1;
    maxPrice += paddingRange;
    minPrice -= paddingRange;
    final viewRange = maxPrice - minPrice;

    // 2. 绘制网格线 (简单绘制3条横线)
    final gridPaint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 1.0;
    
    for (int i = 1; i <= 3; i++) {
        final y = size.height * (i / 4.0);
        canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // 3. 绘制K线
    final paintUp = Paint()
      ..color = const Color(0xFFEF5350) // 红色涨
      ..style = PaintingStyle.fill;
    
    final paintDown = Paint()
      ..color = const Color(0xFF26A69A) // 绿色跌
      ..style = PaintingStyle.fill;

    // 绘制蜡烛图
    // 只绘制能显示在屏幕范围内的 (简单处理：假设数据量不多，全部遍历。实际应用需结合Scrollable)
    // 假设从左到右绘制
    final totalCandleWidth = candleWidth + candleSpacing;
    
    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final x = i * totalCandleWidth + candleSpacing;
      
      if (x > size.width) break; // 超出屏幕不绘制

      // 坐标转换：将价格转换为Y轴坐标
      // Y轴原点在左上角，价格越高Y越小
      double priceToY(double price) {
        return size.height - ((price - minPrice) / viewRange) * size.height;
      }

      final openY = priceToY(item.open);
      final closeY = priceToY(item.close);
      final highY = priceToY(item.high);
      final lowY = priceToY(item.low);

      final isRising = item.close >= item.open;
      final paint = isRising ? paintUp : paintDown;

      // 绘制影线 (High - Low)
      // 使用 drawLine 或者窄矩形
      canvas.drawLine(
        Offset(x + candleWidth / 2, highY),
        Offset(x + candleWidth / 2, lowY),
        paint..strokeWidth = 1.0,
      );

      // 绘制实体 (Open - Close)
      // 如果 Open == Close, 至少绘制1像素高度
      double bodyTop = min(openY, closeY);
      double bodyBottom = max(openY, closeY);
      if (bodyBottom - bodyTop < 1.0) {
        bodyBottom = bodyTop + 1.0;
      }

      canvas.drawRect(
        Rect.fromLTWH(x, bodyTop, candleWidth, bodyBottom - bodyTop),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
