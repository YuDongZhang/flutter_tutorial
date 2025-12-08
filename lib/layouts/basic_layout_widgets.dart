// Flutter 官方布局文档示例 - 基础布局控件
import 'package:flutter/material.dart';

// 基础布局控件示例页面
class BasicLayoutWidgetsExample extends StatelessWidget {
  const BasicLayoutWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础布局控件示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '基础布局控件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. Align 对齐布局
            _buildSectionTitle('1. Align 对齐布局', 'Align Widget'),
            _buildAlignExample(),
            const SizedBox(height: 20),

            // 2. Center 居中布局
            _buildSectionTitle('2. Center 居中布局', 'Center Widget'),
            _buildCenterExample(),
            const SizedBox(height: 20),

            // 3. Padding 内边距布局
            _buildSectionTitle('3. Padding 内边距布局', 'Padding Widget'),
            _buildPaddingExample(),
            const SizedBox(height: 20),

            // 4. SizedBox 固定尺寸布局
            _buildSectionTitle('4. SizedBox 固定尺寸布局', 'SizedBox Widget'),
            _buildSizedBoxExample(),
            const SizedBox(height: 20),

            // 5. Expanded 弹性布局
            _buildSectionTitle('5. Expanded 弹性布局', 'Expanded Widget'),
            _buildExpandedExample(),
            const SizedBox(height: 20),

            // 6. SizedBox.expand 占满空间
            _buildSectionTitle('6. SizedBox.expand 占满空间', 'SizedBox.expand'),
            _buildSizedBoxExpandExample(),
            const SizedBox(height: 20),

            // 7. ConstrainedBox 约束布局
            _buildSectionTitle('7. ConstrainedBox 约束布局', 'ConstrainedBox Widget'),
            _buildConstrainedBoxExample(),
            const SizedBox(height: 20),

            // 8. SizedBox.fromSize 从尺寸创建
            _buildSectionTitle('8. SizedBox.fromSize 从尺寸创建', 'SizedBox.fromSize'),
            _buildSizedBoxFromSizeExample(),
            const SizedBox(height: 20),

            // 9. SizedBox.shrink 收缩到最小
            _buildSectionTitle('9. SizedBox.shrink 收缩到最小', 'SizedBox.shrink'),
            _buildSizedBoxShrinkExample(),
            const SizedBox(height: 20),

            // 10. FractionallySizedBox 百分比尺寸
            _buildSectionTitle('10. FractionallySizedBox 百分比尺寸', 'FractionallySizedBox Widget'),
            _buildFractionallySizedBoxExample(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建 section 标题，中英文对照
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

  // 1. Align 对齐布局
  Widget _buildAlignExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      height: 200,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue[300],
              alignment: Alignment.center,
              child: const Text('左上角'),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue[400],
              alignment: Alignment.center,
              child: const Text('右上角'),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue[500],
              alignment: Alignment.center,
              child: const Text('左下角'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: const Text('右下角'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue[700],
              alignment: Alignment.center,
              child: const Text('居中'),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Center 居中布局
  Widget _buildCenterExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.green[300],
              alignment: Alignment.center,
              child: const Text('居中容器'),
            ),
            const SizedBox(height: 10),
            const Text('这是 Center 包裹的内容'),
          ],
        ),
      ),
    );
  }

  // 3. Padding 内边距布局
  Widget _buildPaddingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          const Text('不同内边距示例：'),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.orange[300],
              child: const Text('EdgeInsets.all(8.0)'),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0, bottom: 4.0),
            child: Container(
              color: Colors.orange[400],
              child: const Text('EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 4)'),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
              color: Colors.orange[500],
              child: const Text('EdgeInsets.symmetric(horizontal: 20, vertical: 10)'),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
            child: Container(
              color: Colors.orange[600],
              child: const Text('EdgeInsets.fromLTRB(24, 12, 24, 12)'),
            ),
          ),
        ],
      ),
    );
  }

  // 4. SizedBox 固定尺寸布局
  Widget _buildSizedBoxExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          const Text('SizedBox 固定尺寸示例：'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Container(
                  color: Colors.purple[300],
                  alignment: Alignment.center,
                  child: const Text('80x80'),
                ),
              ),
              SizedBox(
                width: 120,
                height: 60,
                child: Container(
                  color: Colors.purple[400],
                  alignment: Alignment.center,
                  child: const Text('120x60'),
                ),
              ),
              SizedBox(
                width: 60,
                height: 120,
                child: Container(
                  color: Colors.purple[500],
                  alignment: Alignment.center,
                  child: const Text('60x120'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 5. Expanded 弹性布局
  Widget _buildExpandedExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        children: [
          const Text('Expanded 弹性布局示例：'),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.red[300],
                  alignment: Alignment.center,
                  child: const Text('flex: 1'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 80,
                  color: Colors.red[400],
                  alignment: Alignment.center,
                  child: const Text('flex: 2'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Container(
                  height: 80,
                  color: Colors.red[500],
                  alignment: Alignment.center,
                  child: const Text('flex: 3'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 6. SizedBox.expand 占满空间
  Widget _buildSizedBoxExpandExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      height: 200,
      child: SizedBox.expand(
        child: Container(
          color: Colors.teal[300],
          alignment: Alignment.center,
          child: const Text('SizedBox.expand 占满父容器空间'),
        ),
      ),
    );
  }

  // 7. ConstrainedBox 约束布局
  Widget _buildConstrainedBoxExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.pink, width: 2),
      ),
      child: Column(
        children: [
          const Text('ConstrainedBox 约束布局示例：'),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 50,
              maxWidth: 200,
              maxHeight: 100,
            ),
            child: Container(
              color: Colors.pink[300],
              child: const Text('这是 ConstrainedBox 包裹的内容，会受到约束条件的限制。'),
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 150, height: 75),
            child: Container(
              color: Colors.pink[400],
              alignment: Alignment.center,
              child: const Text('BoxConstraints.tightFor(width: 150, height: 75)'),
            ),
          ),
        ],
      ),
    );
  }

  // 8. SizedBox.fromSize 从尺寸创建
  Widget _buildSizedBoxFromSizeExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          const Text('SizedBox.fromSize 示例：'),
          const SizedBox(height: 10),
          SizedBox.fromSize(
            size: const Size(120, 60),
            child: Container(
              color: Colors.green[300],
              alignment: Alignment.center,
              child: const Text('Size(120, 60)'),
            ),
          ),
        ],
      ),
    );
  }

  // 9. SizedBox.shrink 收缩到最小
  Widget _buildSizedBoxShrinkExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          const Text('SizedBox.shrink 示例：'),
          const SizedBox(height: 10),
          SizedBox.shrink(
            child: Container(
              color: Colors.blue[300],
              child: const Text('收缩到最小尺寸'),
            ),
          ),
        ],
      ),
    );
  }

  // 10. FractionallySizedBox 百分比尺寸
  Widget _buildFractionallySizedBoxExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      height: 200,
      child: Column(
        children: [
          const Text('FractionallySizedBox 百分比尺寸示例：'),
          const SizedBox(height: 10),
          FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.5,
            alignment: Alignment.center,
            child: Container(
              color: Colors.orange[300],
              alignment: Alignment.center,
              child: const Text('widthFactor: 0.8, heightFactor: 0.5'),
            ),
          ),
        ],
      ),
    );
  }
}
