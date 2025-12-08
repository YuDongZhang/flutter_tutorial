// Flutter官方文档示例 - 绘制和效果组件
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// 绘制和效果组件演示页面
class PaintingDemo extends StatelessWidget {
  const PaintingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制和效果组件演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 主标题
            const Text(
              '绘制和效果组件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Painting and Effect Widgets Examples',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // 1. DecoratedBox - 装饰盒子
            _buildSectionTitle('1. 装饰盒子', 'DecoratedBox Widget'),
            _buildDecoratedBoxExample(),
            const SizedBox(height: 20),

            // 2. ClipRRect - 圆角裁剪
            _buildSectionTitle('2. 圆角裁剪', 'ClipRRect Widget'),
            _buildClipRRectExample(),
            const SizedBox(height: 20),

            // 3. ClipOval - 圆形裁剪
            _buildSectionTitle('3. 圆形裁剪', 'ClipOval Widget'),
            _buildClipOvalExample(),
            const SizedBox(height: 20),

            // 4. ClipPath - 路径裁剪
            _buildSectionTitle('4. 路径裁剪', 'ClipPath Widget'),
            _buildClipPathExample(),
            const SizedBox(height: 20),

            // 5. CustomPaint - 自定义绘制
            _buildSectionTitle('5. 自定义绘制', 'CustomPaint Widget'),
            _buildCustomPaintExample(),
            const SizedBox(height: 20),

            // 6. BackdropFilter - 背景滤镜
            _buildSectionTitle('6. 背景滤镜', 'BackdropFilter Widget'),
            _buildBackdropFilterExample(),
            const SizedBox(height: 20),

            // 7. Opacity - 透明度
            _buildSectionTitle('7. 透明度', 'Opacity Widget'),
            _buildOpacityExample(),
            const SizedBox(height: 20),

            // 8. ShaderMask - 着色器遮罩
            _buildSectionTitle('8. 着色器遮罩', 'ShaderMask Widget'),
            _buildShaderMaskExample(),
            const SizedBox(height: 20),

            // 9. Transform - 变换效果
            _buildSectionTitle('9. 变换效果', 'Transform Widget'),
            _buildTransformExample(),
            const SizedBox(height: 20),

            // 10. RotatedBox - 旋转容器
            _buildSectionTitle('10. 旋转容器', 'RotatedBox Widget'),
            _buildRotatedBoxExample(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建section标题，中英文对照
  Widget _buildSectionTitle(String chineseTitle, String englishTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chineseTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          englishTitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // 1. DecoratedBox - 装饰盒子示例
  Widget _buildDecoratedBoxExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          // 基础装饰
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: Text('基础装饰',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // 渐变背景
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: Text('渐变背景',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // 边框装饰
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 3),
            ),
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Center(
                child: Text('边框装饰', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. ClipRRect - 圆角裁剪示例
  Widget _buildClipRRectExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 原始图片
          Container(
            width: 100,
            height: 100,
            color: Colors.green[200],
            alignment: Alignment.center,
            child: const Text('原始'),
          ),
          // 圆角裁剪
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green[200],
              alignment: Alignment.center,
              child: const Text('圆角裁剪'),
            ),
          ),
          // 圆形裁剪（通过圆角实现）
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green[200],
              alignment: Alignment.center,
              child: const Text('圆形裁剪'),
            ),
          ),
        ],
      ),
    );
  }

  // 3. ClipOval - 圆形裁剪示例
  Widget _buildClipOvalExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          // 横向椭圆
          ClipOval(
            child: Container(
              width: 200,
              height: 100,
              color: Colors.orange[200],
              alignment: Alignment.center,
              child: const Text('横向椭圆', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 15),
          // 圆形
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange[200],
              alignment: Alignment.center,
              child: const Text('圆形', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  // 4. ClipPath - 路径裁剪示例
  Widget _buildClipPathExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: ClipPath(
        clipper: _CustomClipper(),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.pink],
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            '路径裁剪示例',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // 5. CustomPaint - 自定义绘制示例
  Widget _buildCustomPaintExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: CustomPaint(
        size: const Size(300, 200),
        painter: _CustomPainter(),
      ),
    );
  }

  // 6. BackdropFilter - 背景滤镜示例
  Widget _buildBackdropFilterExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景图片
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal[200],
            child: const Center(
              child: Text('背景内容',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
          ),
          // 半透明遮罩
          Positioned(
            left: 50,
            right: 50,
            top: 50,
            bottom: 50,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                alignment: Alignment.center,
                child: const Text('模糊效果',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 7. Opacity - 透明度示例
  Widget _buildOpacityExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.yellow, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 不透明
          Opacity(
            opacity: 1.0,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: const Text('1.0'),
            ),
          ),
          // 半透明
          Opacity(
            opacity: 0.75,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: const Text('0.75'),
            ),
          ),
          // 半透明
          Opacity(
            opacity: 0.5,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: const Text('0.5'),
            ),
          ),
          // 透明
          Opacity(
            opacity: 0.25,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: const Text('0.25'),
            ),
          ),
        ],
      ),
    );
  }

  // 8. ShaderMask - 着色器遮罩示例
  Widget _buildShaderMaskExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: const Text(
              '着色器遮罩',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // 9. Transform - 变换效果示例
  Widget _buildTransformExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          // 缩放
          Transform.scale(
            scale: 0.8,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue[200],
              alignment: Alignment.center,
              child: const Text('缩放'),
            ),
          ),
          const SizedBox(height: 15),
          // 旋转
          Transform.rotate(
            angle: 0.25 * 3.14159,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue[300],
              alignment: Alignment.center,
              child: const Text('旋转'),
            ),
          ),
          const SizedBox(height: 15),
          // 平移
          Transform.translate(
            offset: const Offset(20, 0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue[400],
              alignment: Alignment.center,
              child: const Text('平移'),
            ),
          ),
        ],
      ),
    );
  }

  // 10. RotatedBox - 旋转容器示例
  Widget _buildRotatedBoxExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.pink, width: 2),
      ),
      child: Column(
        children: [
          // 原始内容
          Container(
            width: 200,
            height: 100,
            color: Colors.pink[200],
            alignment: Alignment.center,
            child: const Text('原始内容', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 15),
          // 旋转90度
          RotatedBox(
            quarterTurns: 1,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.pink[300],
              alignment: Alignment.center,
              child: const Text('旋转90度', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}

// 自定义裁剪路径
class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // 创建一个波浪形路径
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_CustomClipper oldClipper) => false;
}

// 自定义绘制
class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制背景
    final backgroundPaint = Paint()
      ..color = Colors.red[100]!
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // 绘制圆形
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      80,
      circlePaint,
    );

    // 绘制线条
    final linePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawLine(
      Offset(50, 50),
      Offset(size.width - 50, size.height - 50),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width - 50, 50),
      Offset(50, size.height - 50),
      linePaint,
    );

    // 绘制文本
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '自定义绘制',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(_CustomPainter oldDelegate) => false;
}
