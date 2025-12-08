
// Flutter 官方布局文档示例 - 基础布局
import 'package:flutter/material.dart';

// 基础布局示例页面
class BasicLayoutExample extends StatelessWidget {
  const BasicLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础布局示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '基础布局示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 简单的 Container 示例
            _buildSectionTitle('1. Container 基本使用', 'Container Widget'),
            _buildContainerExample(),
            const SizedBox(height: 20),

            // 2. Column 垂直布局
            _buildSectionTitle('2. Column 垂直布局', 'Column Widget'),
            _buildColumnExample(),
            const SizedBox(height: 20),

            // 3. Row 水平布局
            _buildSectionTitle('3. Row 水平布局', 'Row Widget'),
            _buildRowExample(),
            const SizedBox(height: 20),

            // 4. Stack 堆叠布局
            _buildSectionTitle('4. Stack 堆叠布局', 'Stack Widget'),
            _buildStackExample(),
            const SizedBox(height: 20),

            // 5. Flex 弹性布局
            _buildSectionTitle('5. Flex 弹性布局', 'Flex Widget'),
            _buildFlexExample(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建 section 标题，中英文对照
  Widget _buildSectionTitle(String chineseTitle, [String? englishTitle]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chineseTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        if (englishTitle != null) 
          Text(
            englishTitle,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
      ],
    );
  }

  // Container 基本示例
  Widget _buildContainerExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: const Text(
        '这是一个 Container 示例，用于展示基本的布局属性，包括内边距、背景色、边框和圆角。',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  // Column 垂直布局示例
  Widget _buildColumnExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.green[300],
            alignment: Alignment.center,
            child: const Text('Item 1'),
          ),
          const SizedBox(height: 10),
          Container(
            width: 150,
            height: 100,
            color: Colors.green[500],
            alignment: Alignment.center,
            child: const Text('Item 2'),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            height: 100,
            color: Colors.green[700],
            alignment: Alignment.center,
            child: const Text('Item 3'),
          ),
        ],
      ),
    );
  }

  // Row 水平布局示例
  Widget _buildRowExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.orange[300],
            alignment: Alignment.center,
            child: const Text('1'),
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.orange[500],
            alignment: Alignment.center,
            child: const Text('2'),
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.orange[700],
            alignment: Alignment.center,
            child: const Text('3'),
          ),
        ],
      ),
    );
  }

  // Stack 堆叠布局示例
  Widget _buildStackExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      height: 200,
      child: Stack(
        children: [
          // 背景层
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.purple[300],
          ),
          // 中间层
          Positioned(
            top: 30,
            left: 30,
            width: 100,
            height: 100,
            child: Container(
              color: Colors.purple[500],
              alignment: Alignment.center,
              child: const Text('Layer 1', style: TextStyle(color: Colors.white)),
            ),
          ),
          // 顶层
          Positioned(
            bottom: 30,
            right: 30,
            width: 100,
            height: 100,
            child: Container(
              color: Colors.purple[700],
              alignment: Alignment.center,
              child: const Text('Layer 2', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // Flex 弹性布局示例
  Widget _buildFlexExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.red[300],
              alignment: Alignment.center,
              child: const Text('1份'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              color: Colors.red[500],
              alignment: Alignment.center,
              child: const Text('2份'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 100,
              color: Colors.red[700],
              alignment: Alignment.center,
              child: const Text('3份'),
            ),
          ),
        ],
      ),
    );
  }
}
