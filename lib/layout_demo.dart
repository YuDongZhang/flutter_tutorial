
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
          // Align 示例
          _buildSubSectionTitle('Align', '对齐组件'),
          _buildAlignDemo(),
          const SizedBox(height: 15),

          // Center 示例
          _buildSubSectionTitle('Center', '居中组件'),
          _buildCenterDemo(),
          const SizedBox(height: 15),

          // Padding 示例
          _buildSubSectionTitle('Padding', '内边距组件'),
          _buildPaddingDemo(),
          const SizedBox(height: 15),

          // SizedBox 示例
          _buildSubSectionTitle('SizedBox', '固定尺寸组件'),
          _buildSizedBoxDemo(),
          const SizedBox(height: 15),

          // Expanded 示例
          _buildSubSectionTitle('Expanded', '扩展组件'),
          _buildExpandedDemo(),
          const SizedBox(height: 15),

          // ConstrainedBox 示例
          _buildSubSectionTitle('ConstrainedBox', '约束盒子'),
          _buildConstrainedBoxDemo(),
          const SizedBox(height: 15),

          // FractionallySizedBox 示例
          _buildSubSectionTitle('FractionallySizedBox', '比例尺寸盒子'),
          _buildFractionallySizedBoxDemo(),
          const SizedBox(height: 15),

          // AspectRatio 示例
          _buildSubSectionTitle('AspectRatio', '宽高比组件'),
          _buildAspectRatioDemo(),
          const SizedBox(height: 15),

          // Baseline 示例
          _buildSubSectionTitle('Baseline', '基线对齐组件'),
          _buildBaselineDemo(),
          const SizedBox(height: 15),

          // Wrap 示例
          _buildSubSectionTitle('Wrap', '流式布局组件'),
          _buildWrapDemo(),
          const SizedBox(height: 15),

          // Spacer 示例
          _buildSubSectionTitle('Spacer', '间距填充组件'),
          _buildSpacerDemo(),
          const SizedBox(height: 15),

          // Offstage 示例
          _buildSubSectionTitle('Offstage', '隐藏但保持状态组件'),
          _buildOffstageDemo(),
          const SizedBox(height: 15),

          // LimitedBox 示例
          _buildSubSectionTitle('LimitedBox', '限制尺寸组件'),
          _buildLimitedBoxDemo(),
          const SizedBox(height: 15),

          // IntrinsicWidth/Height 示例
          _buildSubSectionTitle('IntrinsicWidth/Height', '内在尺寸组件'),
          _buildIntrinsicSizeDemo(),
        ],
      ),
    );
  }

  // Align 演示
  Widget _buildAlignDemo() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: Border.all(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 40, height: 40,
              color: Colors.red[300],
              child: const Center(child: Text('TL', style: TextStyle(fontSize: 12))),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 40, height: 40,
              color: Colors.red[400],
              child: const Center(child: Text('TR', style: TextStyle(fontSize: 12))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 40, height: 40,
              color: Colors.red[500],
              child: const Center(child: Text('C', style: TextStyle(fontSize: 12, color: Colors.white))),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 40, height: 40,
              color: Colors.red[600],
              child: const Center(child: Text('BL', style: TextStyle(fontSize: 12, color: Colors.white))),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 40, height: 40,
              color: Colors.red[700],
              child: const Center(child: Text('BR', style: TextStyle(fontSize: 12, color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }

  // Center 演示
  Widget _buildCenterDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.pink[100],
        border: Border.all(color: Colors.pink, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.pink[400],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('我被居中了！', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // Padding 演示
  Widget _buildPaddingDemo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber[100],
        border: Border.all(color: Colors.amber, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text('无Padding', style: TextStyle(fontSize: 12)),
              Container(
                color: Colors.amber[300],
                child: const Text('内容'),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Padding: 8', style: TextStyle(fontSize: 12)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.amber[500],
                  child: const Text('内容'),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Padding: 16', style: TextStyle(fontSize: 12)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.amber[700],
                  child: const Text('内容', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // SizedBox 演示
  Widget _buildSizedBoxDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('50x50', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 50,
              height: 50,
              child: Container(
                color: Colors.cyan[300],
                alignment: Alignment.center,
                child: const Text('50'),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('80x60', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 80,
              height: 60,
              child: Container(
                color: Colors.cyan[500],
                alignment: Alignment.center,
                child: const Text('80x60'),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('100x40', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 100,
              height: 40,
              child: Container(
                color: Colors.cyan[700],
                alignment: Alignment.center,
                child: const Text('100x40', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Expanded 演示
  Widget _buildExpandedDemo() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.indigo[200],
              alignment: Alignment.center,
              child: const Text('flex:1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.indigo[400],
              alignment: Alignment.center,
              child: const Text('flex:2', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.indigo[600],
              alignment: Alignment.center,
              child: const Text('flex:1', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // ConstrainedBox 演示
  Widget _buildConstrainedBoxDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('minWidth: 100', style: TextStyle(fontSize: 11)),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
              child: Container(
                color: Colors.teal[300],
                alignment: Alignment.center,
                child: const Text('Min'),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('maxWidth: 80', style: TextStyle(fontSize: 11)),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 80, maxHeight: 60),
              child: Container(
                color: Colors.teal[500],
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: const Text('Max约束', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // FractionallySizedBox 演示
  Widget _buildFractionallySizedBoxDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.lime[100],
        border: Border.all(color: Colors.lime, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              height: 25,
              color: Colors.lime[400],
              alignment: Alignment.center,
              child: const Text('80% 宽度', style: TextStyle(fontSize: 12)),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              height: 25,
              color: Colors.lime[600],
              alignment: Alignment.center,
              child: const Text('50% 宽度', style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // AspectRatio 演示
  Widget _buildAspectRatioDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('1:1', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 60,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.deepOrange[300],
                  alignment: Alignment.center,
                  child: const Text('正方形'),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('16:9', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 100,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.deepOrange[500],
                  alignment: Alignment.center,
                  child: const Text('16:9', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('4:3', style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 80,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  color: Colors.deepOrange[700],
                  alignment: Alignment.center,
                  child: const Text('4:3', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Baseline 演示
  Widget _buildBaselineDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.brown[100],
        border: Border.all(color: Colors.brown, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('小字', style: TextStyle(fontSize: 12, color: Colors.brown[600])),
          const SizedBox(width: 8),
          Text('中字', style: TextStyle(fontSize: 20, color: Colors.brown[700])),
          const SizedBox(width: 8),
          Text('大字', style: TextStyle(fontSize: 32, color: Colors.brown[800], fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text('特大', style: TextStyle(fontSize: 40, color: Colors.brown[900])),
        ],
      ),
    );
  }

  // Wrap 流式布局演示
  Widget _buildWrapDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        border: Border.all(color: Colors.purple, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        spacing: 8.0,  // 水平间距
        runSpacing: 8.0,  // 垂直间距
        alignment: WrapAlignment.center,
        children: [
          for (int i = 1; i <= 8; i++)
            Chip(
              label: Text('标签 $i'),
              backgroundColor: Colors.purple[200 + (i * 50) % 400],
            ),
        ],
      ),
    );
  }

  // Spacer 间距填充演示
  Widget _buildSpacerDemo() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.green[100],
        border: Border.all(color: Colors.green, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 60, height: 40,
            color: Colors.green[300],
            alignment: Alignment.center,
            child: const Text('Left'),
          ),
          const Spacer(flex: 1),  // 占用1份空间
          Container(
            width: 60, height: 40,
            color: Colors.green[500],
            alignment: Alignment.center,
            child: const Text('Mid'),
          ),
          const Spacer(flex: 2),  // 占用2份空间
          Container(
            width: 60, height: 40,
            color: Colors.green[700],
            alignment: Alignment.center,
            child: const Text('Right', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Offstage 隐藏演示（需要StatefulWidget，这里用静态示例）
  Widget _buildOffstageDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('可见元素: '),
              Container(
                width: 50, height: 30,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('显示', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('隐藏元素: '),
              const Offstage(
                offstage: true,  // true = 隐藏
                child: Text('这段文字被隐藏了'),
              ),
              Text('[Offstage隐藏中]', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '* Offstage隐藏元素但保持状态，与Visibility不同',
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // LimitedBox 限制尺寸演示
  Widget _buildLimitedBoxDemo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.orange[100],
        border: Border.all(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('maxWidth: 80', style: TextStyle(fontSize: 11)),
              LimitedBox(
                maxWidth: 80,
                maxHeight: 40,
                child: Container(
                  color: Colors.orange[400],
                  alignment: Alignment.center,
                  child: const Text('限制宽', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('maxHeight: 30', style: TextStyle(fontSize: 11)),
              LimitedBox(
                maxWidth: 100,
                maxHeight: 30,
                child: Container(
                  color: Colors.orange[600],
                  alignment: Alignment.center,
                  child: const Text('限制高', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // IntrinsicWidth/Height 内在尺寸演示
  Widget _buildIntrinsicSizeDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        border: Border.all(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('IntrinsicWidth使子元素宽度一致:', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('短')),
                const SizedBox(height: 4),
                ElevatedButton(onPressed: () {}, child: const Text('中等长度按钮')),
                const SizedBox(height: 4),
                ElevatedButton(onPressed: () {}, child: const Text('很长很长的按钮文字')),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '* 所有按钮宽度自动匹配最宽的按钮',
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
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
