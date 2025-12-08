
// Flutter官方布局文档示例 - 综合演示
import 'package:flutter/material.dart';

// 布局综合演示页面
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局综合演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 主标题
            const Text(
              'Flutter布局综合示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Layout Comprehensive Examples',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // 1. 基础布局
            _buildSectionTitle('1. 基础布局', 'Basic Layout'),
            _buildBasicLayoutExamples(),
            const SizedBox(height: 20),

            // 2. 列表布局
            _buildSectionTitle('2. 列表布局', 'List Layout'),
            _buildListLayoutExamples(),
            const SizedBox(height: 20),

            // 3. Sliver滚动效果
            _buildSectionTitle('3. Sliver滚动效果', 'Sliver Scroll Effects'),
            _buildSliverExamples(),
            const SizedBox(height: 20),

            // 4. 响应式布局
            _buildSectionTitle('4. 响应式布局', 'Responsive Layout'),
            _buildResponsiveLayoutExamples(),
            const SizedBox(height: 20),

            // 5. 布局控件示例
            _buildSectionTitle('5. 布局控件', 'Layout Widgets'),
            _buildLayoutWidgetsExamples(),
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

  // 1. 基础布局示例
  Widget _buildBasicLayoutExamples() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container示例
          _buildSubSectionTitle('Container', '容器组件'),
          _buildContainerDemo(),
          const SizedBox(height: 15),
          
          // Column示例
          _buildSubSectionTitle('Column', '垂直布局'),
          _buildColumnDemo(),
          const SizedBox(height: 15),
          
          // Row示例
          _buildSubSectionTitle('Row', '水平布局'),
          _buildRowDemo(),
          const SizedBox(height: 15),
          
          // Stack示例
          _buildSubSectionTitle('Stack', '堆叠布局'),
          _buildStackDemo(),
          const SizedBox(height: 15),
          
          // Flex示例
          _buildSubSectionTitle('Flex', '弹性布局'),
          _buildFlexDemo(),
          const SizedBox(height: 15),
          
          // 嵌套布局示例
          _buildSubSectionTitle('Nested Layout', '嵌套布局'),
          _buildNestedLayoutDemo(),
        ],
      ),
    );
  }

  // 2. 列表布局示例
  Widget _buildListLayoutExamples() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 水平列表
          _buildSubSectionTitle('Horizontal List', '横向列表'),
          SizedBox(
            height: 100,
            child: _buildHorizontalList(),
          ),
          const SizedBox(height: 15),
          
          // 网格视图
          _buildSubSectionTitle('GridView', '网格视图'),
          SizedBox(
            height: 200,
            child: _buildGridView(),
          ),
        ],
      ),
    );
  }

  // 3. Sliver滚动效果示例
  Widget _buildSliverExamples() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubSectionTitle('SliverAppBar', '浮动顶栏'),
          const Text('SliverAppBar可以实现浮动顶栏效果，当滚动时会自动展开和收缩。'),
          const SizedBox(height: 10),
          _buildSubSectionTitle('Parallax Effect', '视差滚动'),
          const Text('使用SliverPersistentHeader可以实现视差滚动效果，背景图片和内容以不同速度滚动。'),
        ],
      ),
    );
  }

  // 4. 响应式布局示例
  Widget _buildResponsiveLayoutExamples() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubSectionTitle('SafeArea', '安全区域'),
          const Text('SafeArea会自动避开刘海屏、状态栏等系统UI元素，确保内容可见。'),
          const SizedBox(height: 10),
          _buildSubSectionTitle('MediaQuery', '媒体查询'),
          const Text('MediaQuery可以获取设备屏幕信息，如尺寸、方向、像素密度等，用于响应式设计。'),
          const SizedBox(height: 10),
          _buildSubSectionTitle('LayoutBuilder', '布局构建器'),
          const Text('LayoutBuilder可以根据父组件的约束条件动态构建布局，适用于响应式设计。'),
        ],
      ),
    );
  }

  // 5. 布局控件示例
  Widget _buildLayoutWidgetsExamples() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildLayoutWidgetChip('Align'),
              _buildLayoutWidgetChip('Center'),
              _buildLayoutWidgetChip('Padding'),
              _buildLayoutWidgetChip('SizedBox'),
              _buildLayoutWidgetChip('Expanded'),
              _buildLayoutWidgetChip('ConstrainedBox'),
              _buildLayoutWidgetChip('FractionallySizedBox'),
              _buildLayoutWidgetChip('AspectRatio'),
              _buildLayoutWidgetChip('Baseline'),
              _buildLayoutWidgetChip('CustomSingleChildLayout'),
            ],
          ),
        ],
      ),
    );
  }

  // 构建子标题
  Widget _buildSubSectionTitle(String widgetName, String description) {
    return Row(
      children: [
        Text(
          widgetName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // 构建布局控件芯片
  Widget _buildLayoutWidgetChip(String widgetName) {
    return Chip(
      label: Text(widgetName),
      backgroundColor: Colors.red[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  // Container组件演示
  Widget _buildContainerDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Container是一个全能布局组件，可以设置宽高、边距、内边距、背景色等',
        textAlign: TextAlign.center,
      ),
    );
  }

  // Column垂直布局演示
  Widget _buildColumnDemo() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green[100],
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80, height: 40,
            color: Colors.green[300],
            alignment: Alignment.center,
            child: const Text('Item 1'),
          ),
          Container(
            width: 80, height: 40,
            color: Colors.green[500],
            alignment: Alignment.center,
            child: const Text('Item 2'),
          ),
          Container(
            width: 80, height: 40,
            color: Colors.green[700],
            alignment: Alignment.center,
            child: const Text('Item 3'),
          ),
        ],
      ),
    );
  }

  // Row水平布局演示
  Widget _buildRowDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.orange[100],
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60, height: 60,
            color: Colors.orange[300],
            alignment: Alignment.center,
            child: const Text('1'),
          ),
          Container(
            width: 60, height: 60,
            color: Colors.orange[500],
            alignment: Alignment.center,
            child: const Text('2'),
          ),
          Container(
            width: 60, height: 60,
            color: Colors.orange[700],
            alignment: Alignment.center,
            child: const Text('3'),
          ),
        ],
      ),
    );
  }

  // Stack堆叠布局演示
  Widget _buildStackDemo() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.purple[100],
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // 背景层
          Positioned.fill(
            child: Container(
              color: Colors.purple[300],
            ),
          ),
          // 中间层
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 80, height: 80,
              color: Colors.purple[500],
              alignment: Alignment.center,
              child: const Text('Layer 1', style: TextStyle(color: Colors.white)),
            ),
          ),
          // 顶层
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 80, height: 80,
              color: Colors.purple[700],
              alignment: Alignment.center,
              child: const Text('Layer 2', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // Flex弹性布局演示
  Widget _buildFlexDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red[300],
              alignment: Alignment.center,
              child: const Text('flex: 1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red[500],
              alignment: Alignment.center,
              child: const Text('flex: 2'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.red[700],
              alignment: Alignment.center,
              child: const Text('flex: 3'),
            ),
          ),
        ],
      ),
    );
  }

  // 嵌套布局演示
  Widget _buildNestedLayoutDemo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal[100],
        border: Border.all(color: Colors.teal, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('用户信息卡', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                alignment: Alignment.center,
                child: const Text('头像', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              // 信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('用户名', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    const Text('这是用户的个人简介，展示了如何在Flutter中使用嵌套布局'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          child: const Text('关注', style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[300],
                          ),
                          child: const Text('私信'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 横向列表演示
  Widget _buildHorizontalList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 120,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text('Item ${index + 1}'),
        );
      },
    );
  }

  // 网格视图演示
  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text('Item ${index + 1}'),
        );
      }),
    );
  }
}
