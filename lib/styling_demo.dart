// Flutter官方文档示例 - 样式组件
import 'package:flutter/material.dart';

// 样式组件演示页面
class StylingDemo extends StatelessWidget {
  const StylingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('样式组件演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 主标题
            const Text(
              '样式组件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Styling Widgets Examples',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // 1. Theme - 主题组件
            _buildSectionTitle('1. 主题组件', 'Theme Widget'),
            _buildThemeExample(),
            const SizedBox(height: 20),

            // 2. MediaQuery - 媒体查询
            _buildSectionTitle('2. 媒体查询', 'MediaQuery Widget'),
            _buildMediaQueryExample(),
            const SizedBox(height: 20),

            // 3. Padding - 内边距
            _buildSectionTitle('3. 内边距', 'Padding Widget'),
            _buildPaddingExample(),
            const SizedBox(height: 20),

            // 4. Container - 容器样式
            _buildSectionTitle('4. 容器样式', 'Container Styling'),
            _buildContainerStylingExample(),
            const SizedBox(height: 20),

            // 5. 文本样式
            _buildSectionTitle('5. 文本样式', 'Text Styling'),
            _buildTextStylingExample(),
            const SizedBox(height: 20),

            // 6. 按钮样式
            _buildSectionTitle('6. 按钮样式', 'Button Styling'),
            _buildButtonStylingExample(),
            const SizedBox(height: 20),

            // 7. 卡片样式
            _buildSectionTitle('7. 卡片样式', 'Card Styling'),
            _buildCardStylingExample(),
            const SizedBox(height: 20),

            // 8. 自定义主题
            _buildSectionTitle('8. 自定义主题', 'Custom Theme'),
            _buildCustomThemeExample(),
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

  // 1. Theme - 主题组件示例
  Widget _buildThemeExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          // 使用默认主题的文本
          const Text('使用默认主题的文本'),
          const SizedBox(height: 10),
          // 自定义主题
          Theme(
            data: ThemeData(
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: const Text('使用自定义主题的文本'),
          ),
          const SizedBox(height: 10),
          // 嵌套主题
          Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('嵌套主题按钮'),
            ),
          ),
        ],
      ),
    );
  }

  // 2. MediaQuery - 媒体查询示例
  Widget _buildMediaQueryExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Builder(
        builder: (context) {
          // 获取媒体查询数据
          final mediaQuery = MediaQuery.of(context);
          final screenSize = mediaQuery.size;
          final orientation = mediaQuery.orientation;
          final devicePixelRatio = mediaQuery.devicePixelRatio;
          final textScaler = mediaQuery.textScaler;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('屏幕宽度: ${screenSize.width.toStringAsFixed(2)}px'),
              Text('屏幕高度: ${screenSize.height.toStringAsFixed(2)}px'),
              Text(
                  '屏幕方向: ${orientation == Orientation.portrait ? '竖屏' : '横屏'}'),
              Text('像素密度: ${devicePixelRatio.toStringAsFixed(2)}'),
              Text('文本缩放因子: ${textScaler.scale(1.0).toStringAsFixed(2)}'),
              const SizedBox(height: 15),
              // 根据屏幕方向显示不同布局
              orientation == Orientation.portrait
                  ? _buildPortraitLayout()
                  : _buildLandscapeLayout(),
            ],
          );
        },
      ),
    );
  }

  // 竖屏布局
  Widget _buildPortraitLayout() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.green[200],
      child: const Column(
        children: [
          Text('当前是竖屏布局'),
          SizedBox(height: 10),
          Text('内容垂直排列'),
        ],
      ),
    );
  }

  // 横屏布局
  Widget _buildLandscapeLayout() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.green[200],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('当前是横屏布局'),
          Text('内容水平排列'),
        ],
      ),
    );
  }

  // 3. Padding - 内边距示例
  Widget _buildPaddingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          // 无内边距
          Container(
            color: Colors.orange[200],
            child: const Text('无内边距的文本'),
          ),
          const SizedBox(height: 10),
          // 统一内边距
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.orange[300],
              child: const Text('统一内边距的文本'),
            ),
          ),
          const SizedBox(height: 10),
          // 不同方向内边距
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 16.0,
              right: 24.0,
              bottom: 4.0,
            ),
            child: Container(
              color: Colors.orange[400],
              child: const Text('不同方向内边距的文本'),
            ),
          ),
          const SizedBox(height: 10),
          // 对称内边距
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
              color: Colors.orange[500],
              child: const Text('对称内边距的文本'),
            ),
          ),
        ],
      ),
    );
  }

  // 4. Container - 容器样式示例
  Widget _buildContainerStylingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          // 基础容器样式
          Container(
            width: 200,
            height: 100,
            color: Colors.purple[200],
            alignment: Alignment.center,
            child: const Text('基础容器'),
          ),
          const SizedBox(height: 15),
          // 带装饰的容器
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.purple[300],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text('带阴影的容器'),
          ),
          const SizedBox(height: 15),
          // 渐变背景容器
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.pink],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Text('渐变背景容器', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // 5. 文本样式示例
  Widget _buildTextStylingExample() {
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
          const Text(
            '文本样式示例',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '不同字体大小和粗细',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '不同颜色和样式',
            style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '下划线和删除线',
            style: TextStyle(
              decoration: TextDecoration.combine([
                TextDecoration.underline,
                TextDecoration.lineThrough,
              ]),
            ),
          ),
          const SizedBox(height: 5),
          const Text.rich(
            TextSpan(
              text: '富文本示例：',
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: '粗体',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '，'),
                TextSpan(
                  text: '斜体',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(text: '，'),
                TextSpan(
                  text: '彩色',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 6. 按钮样式示例
  Widget _buildButtonStylingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          // 默认按钮
          ElevatedButton(
            onPressed: () {},
            child: const Text('默认按钮'),
          ),
          const SizedBox(height: 10),
          // 自定义样式按钮
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('自定义样式按钮'),
          ),
          const SizedBox(height: 10),
          // 描边按钮
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              side: const BorderSide(color: Colors.teal, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('描边按钮'),
          ),
          const SizedBox(height: 10),
          // 文本按钮
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text('文本按钮'),
          ),
        ],
      ),
    );
  }

  // 7. 卡片样式示例
  Widget _buildCardStylingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.yellow, width: 2),
      ),
      child: Column(
        children: [
          // 默认卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text('默认卡片'),
            ),
          ),
          const SizedBox(height: 15),
          // 自定义阴影和形状的卡片
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('自定义卡片',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('这是一个带有自定义阴影和圆角的卡片，包含多行文本内容。',
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('按钮1'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('按钮2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 8. 自定义主题示例
  Widget _buildCustomThemeExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Theme(
        data: ThemeData(
          // 自定义颜色方案
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.light,
          ),
          // 自定义文本主题
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          // 自定义按钮主题
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        child: Column(
          children: [
            const Text('自定义主题示例',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text('这是使用自定义主题的文本，展示了自定义的字体大小和行高。'),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: const Text('自定义主题按钮'),
            ),
            const SizedBox(height: 15),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text('自定义主题下的卡片'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
