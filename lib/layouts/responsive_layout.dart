
// Flutter 官方布局文档示例 - 响应式布局
import 'package:flutter/material.dart';

// 响应式布局示例页面
class ResponsiveLayoutExample extends StatelessWidget {
  const ResponsiveLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('响应式布局示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '响应式布局示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. SafeArea & MediaQuery
            _buildSectionTitle('1. SafeArea & MediaQuery', 'SafeArea & MediaQuery Widgets'),
            _buildSafeAreaExample(),
            const SizedBox(height: 20),

            // 2. 大屏幕适配
            _buildSectionTitle('2. 大屏幕适配', 'Large Screen Adaptation'),
            _buildLargeScreenExample(),
            const SizedBox(height: 20),

            // 3. 可折叠设备适配
            _buildSectionTitle('3. 可折叠设备适配', 'Foldable Device Adaptation'),
            _buildFoldableDeviceExample(),
            const SizedBox(height: 20),

            // 4. 不同方向适配
            _buildSectionTitle('4. 横竖屏适配', 'Orientation Adaptation'),
            _buildOrientationExample(),
            const SizedBox(height: 20),

            // 5. 动态布局
            _buildSectionTitle('5. 动态布局', 'Dynamic Layout'),
            _buildDynamicLayoutExample(),
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

  // 1. SafeArea & MediaQuery 示例
  Widget _buildSafeAreaExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SafeArea 示例：'),
          const SizedBox(height: 10),
          Container(
            height: 150,
            color: Colors.blue[200],
            child: SafeArea(
              child: Column(
                children: [
                  const Text('这是 SafeArea 包裹的内容，'),
                  const Text('会自动避开刘海屏、状态栏等安全区域。'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      color: Colors.blue[300],
                      alignment: Alignment.center,
                      child: const Text('内容区域'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('MediaQuery 示例：'),
          const SizedBox(height: 10),
          Builder(
            builder: (context) {
              // 获取屏幕尺寸
              final screenSize = MediaQuery.of(context).size;
              final orientation = MediaQuery.of(context).orientation;
              
              return Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('屏幕宽度: ${screenSize.width.toStringAsFixed(2)}'),
                    Text('屏幕高度: ${screenSize.height.toStringAsFixed(2)}'),
                    Text('屏幕方向: ${orientation == Orientation.portrait ? '竖屏' : '横屏'}'),
                    Text('像素密度: ${MediaQuery.of(context).devicePixelRatio.toStringAsFixed(2)}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 2. 大屏幕适配示例
  Widget _buildLargeScreenExample() {
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
          const Text('大屏幕适配：根据屏幕宽度显示不同布局'),
          const SizedBox(height: 10),
          _buildAdaptiveLayout(),
        ],
      ),
    );
  }

  // 自适应布局
  Widget _buildAdaptiveLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // 大屏幕布局
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                  color: Colors.green[300],
                  alignment: Alignment.center,
                  child: const Text('大屏幕布局 - 左侧内容', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(
                  height: 150,
                  color: Colors.green[500],
                  alignment: Alignment.center,
                  child: const Text('大屏幕布局 - 右侧内容', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          );
        } else {
          // 小屏幕布局
          return Column(
            children: [
              Container(
                height: 100,
                color: Colors.green[300],
                alignment: Alignment.center,
                child: const Text('小屏幕布局 - 顶部内容', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                color: Colors.green[500],
                alignment: Alignment.center,
                child: const Text('小屏幕布局 - 底部内容', style: TextStyle(fontSize: 18)),
              ),
            ],
          );
        }
      },
    );
  }

  // 3. 可折叠设备适配示例
  Widget _buildFoldableDeviceExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('可折叠设备适配：根据铰链位置调整布局'),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                // 左侧内容
                Expanded(
                  child: Container(
                    color: Colors.orange[300],
                    alignment: Alignment.center,
                    child: const Text('左侧屏幕', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // 铰链区域
                Container(
                  width: 20,
                  color: Colors.orange[600],
                  alignment: Alignment.center,
                  child: const Text('铰链', style: TextStyle(color: Colors.white)),
                ),
                // 右侧内容
                Expanded(
                  child: Container(
                    color: Colors.orange[500],
                    alignment: Alignment.center,
                    child: const Text('右侧屏幕', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. 横竖屏适配示例
  Widget _buildOrientationExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('横竖屏适配：根据设备方向调整布局'),
          const SizedBox(height: 10),
          Builder(
            builder: (context) {
              final orientation = MediaQuery.of(context).orientation;
              
              return orientation == Orientation.portrait
                  ? _buildPortraitLayout()
                  : _buildLandscapeLayout();
            },
          ),
        ],
      ),
    );
  }

  // 竖屏布局
  Widget _buildPortraitLayout() {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.purple[300],
          alignment: Alignment.center,
          child: const Text('竖屏 - 顶部', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 10),
        Container(
          height: 100,
          color: Colors.purple[500],
          alignment: Alignment.center,
          child: const Text('竖屏 - 中部', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(height: 10),
        Container(
          height: 100,
          color: Colors.purple[700],
          alignment: Alignment.center,
          child: const Text('竖屏 - 底部', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  // 横屏布局
  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            color: Colors.purple[300],
            alignment: Alignment.center,
            child: const Text('横屏 - 左侧', style: TextStyle(fontSize: 18)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 200,
            color: Colors.purple[500],
            alignment: Alignment.center,
            child: const Text('横屏 - 右侧', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }

  // 5. 动态布局示例
  Widget _buildDynamicLayoutExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('动态布局：根据内容数量自动调整'),
          const SizedBox(height: 10),
          // 模拟动态内容
          _buildDynamicContentLayout(),
        ],
      ),
    );
  }

  // 动态内容布局
  Widget _buildDynamicContentLayout() {
    // 模拟动态生成的内容
    final items = List.generate(3, (index) => '动态内容 ${index + 1}');
    
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.map((item) {
        return Chip(
          label: Text(item),
          backgroundColor: Colors.red[200],
        );
      }).toList(),
    );
  }
}
