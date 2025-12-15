import 'package:flutter/material.dart';
import 'widgets/gradient_button.dart';
import 'widgets/weather_chart.dart';
import 'widgets/watermark_widget.dart';
import 'widgets/custom_render_object.dart';
import 'widgets/k_line_chart.dart';
import 'dart:math';

class CustomWidgetHome extends StatelessWidget {
  const CustomWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("自定义控件演示")),
      body: WatermarkWidget(
        watermarkText: "Flutter Demo",
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildSection(
              title: "1. 组合组件 (Composition)",
              description: "GradientButton: 封装Container, InkWell, Animation",
              child: Center(
                child: GradientButton(
                  text: "点击有缩放效果",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("按钮被点击!")),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "2. 自定义绘制 (CustomPaint)",
              description: "WeatherChart: 使用Canvas绘制简单的折线图",
              child: const WeatherChart(
                temperatures: [20, 22, 25, 23, 21, 24, 26, 28, 25, 22],
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "3. 布局与覆盖 (Stack & Overlay)",
              description: "WatermarkWidget: 当前页面已添加水印 (见背景)",
              child: Container(
                height: 100,
                color: Colors.blue.withOpacity(0.1),
                alignment: Alignment.center,
                child: const Text("这里是普通内容区域"),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "4. 底层渲染 (RenderObject)",
              description: "ShadowBox: 自定义RenderObject实现阴影绘制",
              child: const Center(
                child: ShadowBox(
                  distance: 10,
                  color: Colors.blueGrey,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ColoredBox(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "Child",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "5. 股票K线图 (Stock K-Line)",
              description: "KLineChart: 自定义Painter绘制蜡烛图",
              child: KLineChart(
                data: _generateKLineData(),
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 模拟生成30天的K线数据
  List<KLineData> _generateKLineData() {
    final List<KLineData> data = [];
    final random = Random();
    double basePrice = 100.0;
    final now = DateTime.now();

    for (int i = 0; i < 30; i++) {
        // 随机波动
        double volatility = basePrice * 0.05; // 5% 波动
        double change = (random.nextDouble() - 0.5) * volatility;
        double close = basePrice + change;
        
        // 生成 High / Low
        double high = max(basePrice, close) + random.nextDouble() * 2;
        double low = min(basePrice, close) - random.nextDouble() * 2;

        data.add(KLineData(
          time: now.subtract(Duration(days: 29 - i)),
          open: basePrice,
          high: high,
          low: low,
          close: close,
        ));

        basePrice = close; // 下一天开盘 = 今天收盘
    }
    return data;
  }

  Widget _buildSection({required String title, required String description, required Widget child}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 15),
            child,
          ],
        ),
      ),
    );
  }
}
