// Flutter核心库导入，提供了构建UI所需的所有基础组件和功能
import 'package:flutter/material.dart';
// 导入各个示例页面
import 'layout_demo.dart';
import 'state_management_demo.dart';
import 'navigation_demo.dart';
import 'network_demo.dart';
import 'animation_demo.dart';
// 导入布局示例
import 'layouts/basic_layout.dart';
import 'layouts/list_examples.dart';
import 'layouts/sliver_examples.dart';
import 'layouts/responsive_layout.dart';
import 'layouts/basic_layout_widgets.dart';
// 导入无障碍示例
import 'accessibility_demo.dart';
// 导入资源示例
import 'assets_demo.dart';
// 导入异步组件示例
import 'async_demo.dart';
// 导入输入控件示例
import 'input_demo.dart';
// 导入交互模型部件示例
import 'interaction_demo.dart';
// 导入绘制和效果组件示例
import 'painting_demo.dart';
// 导入样式组件示例
import 'styling_demo.dart';

// Flutter应用的入口函数，所有Flutter应用都从这里开始执行
void main() {
  // runApp函数将Widget树渲染到屏幕上
  runApp(const MyApp());
}

// MyApp是应用的根Widget，继承自StatelessWidget（无状态组件）
// 无状态组件意味着它的属性一旦初始化就不会改变，UI完全由构造函数参数决定
class MyApp extends StatelessWidget {
  // Key用于Widget树中标识唯一Widget，帮助Flutter识别Widget的变化
  const MyApp({super.key});

  // build方法是Widget的核心，用于构建Widget树
  // 当Widget需要渲染或更新时，Flutter会调用此方法
  @override
  Widget build(BuildContext context) {
    // MaterialApp是Material Design风格应用的根组件
    // 提供了主题、路由、本地化等核心功能
    return MaterialApp(
      // 应用标题，显示在任务管理器中
      title: 'Flutter教程',
      // 应用主题配置
      theme: ThemeData(
        // 使用Material 3设计系统
        useMaterial3: true,
        // 基于种子色生成整个主题配色方案
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // 应用首页
      home: const MainPage(),
    );
  }
}

// 主页面，用于导航到各个示例
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter教程'),
      ),
      body: SingleChildScrollView(
        // 添加外部滚动容器
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 显示总体布局高度信息
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📏 卡片布局信息',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '• 网格布局：2列 x ${((11 + 1) / 2).ceil()}行',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                    Text(
                      '• 卡片间距：16px',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                    Text(
                      '• 每个卡片尺寸：自适应内容，最小高度约100px',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 显示单个卡片高度演示
              _buildHeightDemoCard(),
              const SizedBox(height: 16),
              // 网格布局
              GridView.count(
                // 网格布局，每行2列
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                // 设置宽高比，使卡片高度为50px（宽度/高度的比例）
                childAspectRatio: 3.0,
                // 设置为true，让GridView只占用内容所需高度
                shrinkWrap: true,
                // 禁止内部滚动，使用外部滚动
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // 计数器示例卡片
                  _buildDemoCard(
                    context,
                    title: '计数器示例',
                    description: '基础的状态管理示例',
                    icon: Icons.countertops,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyHomePage(title: '计数器示例')),
                      );
                    },
                  ),
                  // 布局演示卡片
                  _buildDemoCard(
                    context,
                    title: '布局组件',
                    description: 'Container、Column、Row等布局组件',
                    icon: Icons.grid_view,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LayoutDemo()),
                      );
                    },
                  ),
                  // 基础布局示例
                  _buildDemoCard(
                    context,
                    title: '基础布局',
                    description: '官方文档基础布局示例',
                    icon: Icons.layers,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasicLayoutExample()),
                      );
                    },
                  ),
                  // 基础布局控件示例
                  _buildDemoCard(
                    context,
                    title: '布局控件',
                    description: 'Align、Center、Padding等基础布局控件',
                    icon: Icons.grid_3x3,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BasicLayoutWidgetsExample()),
                      );
                    },
                  ),
                  // 列表布局示例
                  _buildDemoCard(
                    context,
                    title: '列表布局',
                    description: '横向列表、网格视图、长列表等',
                    icon: Icons.list,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListExamples()),
                      );
                    },
                  ),
                  // Sliver滚动效果
                  _buildDemoCard(
                    context,
                    title: 'Sliver滚动',
                    description: '浮动顶栏、平行错位滚动',
                    icon: Icons.scatter_plot,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SliverExamples()),
                      );
                    },
                  ),
                  // 响应式布局
                  _buildDemoCard(
                    context,
                    title: '响应式布局',
                    description: '大屏适配、横竖屏适配',
                    icon: Icons.devices_other,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ResponsiveLayoutExample()),
                      );
                    },
                  ),
                  // 状态管理卡片
                  _buildDemoCard(
                    context,
                    title: '状态管理',
                    description: '多种状态管理场景示例',
                    icon: Icons.manage_accounts,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StateManagementDemo()),
                      );
                    },
                  ),
                  // 导航示例卡片
                  _buildDemoCard(
                    context,
                    title: '导航系统',
                    description: '页面跳转、底部导航、抽屉等',
                    icon: Icons.navigation,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationDemo()),
                      );
                    },
                  ),
                  // 网络请求卡片
                  _buildDemoCard(
                    context,
                    title: '网络请求',
                    description: 'GET、POST请求示例',
                    icon: Icons.network_cell,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NetworkDemo()),
                      );
                    },
                  ),
                  // 动画效果卡片
                  _buildDemoCard(
                    context,
                    title: '动画效果',
                    description: '各种动画效果示例',
                    icon: Icons.animation,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimationDemo()),
                      );
                    },
                  ),
                  // 无障碍功能示例
                  _buildDemoCard(
                    context,
                    title: '无障碍功能',
                    description: '屏幕阅读器、语义化等无障碍支持',
                    icon: Icons.accessibility_new,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccessibilityDemo()),
                      );
                    },
                  ),
                  // 资源、图片和图标示例
                  _buildDemoCard(
                    context,
                    title: '资源与图片',
                    description: '图标、网络图片、本地资源等示例',
                    icon: Icons.image,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssetsDemo()),
                      );
                    },
                  ),
                  // 异步组件示例
                  _buildDemoCard(
                    context,
                    title: '异步组件',
                    description: 'FutureBuilder和StreamBuilder示例',
                    icon: Icons.timer,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AsyncDemo()),
                      );
                    },
                  ),
                  // 输入控件示例
                  _buildDemoCard(
                    context,
                    title: '输入控件',
                    description: '文本输入、选择控件、按钮等',
                    icon: Icons.keyboard,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InputDemo()),
                      );
                    },
                  ),
                  // 交互模型部件示例
                  _buildDemoCard(
                    context,
                    title: '交互模型',
                    description: '拖拽、滑动删除、手势检测等',
                    icon: Icons.handshake,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InteractionDemo()),
                      );
                    },
                  ),
                  // 绘制和效果组件示例
                  _buildDemoCard(
                    context,
                    title: '绘制和效果',
                    description: '装饰、裁剪、滤镜、变换等效果',
                    icon: Icons.palette,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaintingDemo()),
                      );
                    },
                  ),
                  // 样式组件示例
                  _buildDemoCard(
                    context,
                    title: '样式组件',
                    description: '主题、媒体查询、内边距等样式相关组件',
                    icon: Icons.format_paint,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StylingDemo()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建示例卡片
  Widget _buildDemoCard(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required VoidCallback onTap}) {
    return SizedBox(
      height: 50, // 设置固定高度为50
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(6.0), // 调整内边距以适应新高度
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    size: 24, // 减小图标大小以适应新高度
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 2), // 减小间距
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold), // 减小字体大小
                ),
                const SizedBox(height: 1), // 减小间距
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 10), // 减小字体大小
                  textAlign: TextAlign.center,
                  maxLines: 2, // 限制最大行数
                  overflow: TextOverflow.ellipsis, // 超出显示省略号
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 构建卡片高度演示卡片
  Widget _buildHeightDemoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red[300]!, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.straighten, color: Colors.red[600], size: 20),
                const SizedBox(width: 8),
                Text(
                  '卡片高度演示',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 高度指示器
            Container(
              height: 50, // 明确设置高度
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[50],
                border:
                    Border.all(color: Colors.red[200] ?? Colors.red, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 高度标记线
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '高度: 50px',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.rectangle, color: Colors.red[400], size: 32),
                      const SizedBox(height: 8),
                      Text(
                        '固定高度卡片',
                        style: TextStyle(
                          color: Colors.red[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '可以明确控制高度',
                        style: TextStyle(
                          color: Colors.red[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // 高度控制说明
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Colors.amber[200] ?? Colors.amber, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📏 卡片高度控制方式：',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '1. 固定高度：设置 height 属性',
                    style: TextStyle(color: Colors.amber[700], fontSize: 12),
                  ),
                  Text(
                    '2. 自适应：根据内容自动计算',
                    style: TextStyle(color: Colors.amber[700], fontSize: 12),
                  ),
                  Text(
                    '3. 约束高度：使用 SizedBox 或 Container',
                    style: TextStyle(color: Colors.amber[700], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 原始的计数器示例页面
class MyHomePage extends StatefulWidget {
  // 构造函数，接收标题参数
  const MyHomePage({super.key, required this.title});

  // 声明一个不可变的标题属性，用于传递给State
  final String title;

  // 创建State对象，StatefulWidget本身不管理状态，而是委托给State
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState是MyHomePage的状态管理类
// 以下划线开头表示私有类，只能在当前文件中访问
class _MyHomePageState extends State<MyHomePage> {
  // 定义计数器状态变量，初始值为0
  int _counter = 0;

  // 计数器增加方法
  void _incrementCounter() {
    // setState方法是State类的核心，用于通知Flutter状态已改变
    // 调用setState后，Flutter会重新调用build方法，更新UI
    setState(() {
      _counter++;
    });
  }

  // 构建页面UI
  @override
  Widget build(BuildContext context) {
    // Scaffold是Material Design中的基本页面布局组件
    // 提供了AppBar、BottomNavigationBar、Drawer等常见页面元素
    return Scaffold(
      // AppBar是页面顶部的导航栏
      appBar: AppBar(
        // 设置AppBar背景色，使用主题中的反色
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 设置AppBar标题，使用widget.title访问StatefulWidget的属性
        title: Text(widget.title),
      ),
      // body是页面的主要内容区域
      body: Center(
        // Center组件将其子组件居中显示
        child: Column(
          // Column是垂直布局组件，将子组件垂直排列
          // mainAxisAlignment控制主轴（垂直方向）上的对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          // children是Column的子组件列表
          children: <Widget>[
            // Text组件用于显示文本
            const Text(
              '你点击按钮的次数：',
              style: TextStyle(fontSize: 18), // 设置文本样式
            ),
            // 显示计数器值，使用主题中的标题样式
            Text(
              '$_counter', // 字符串插值，将_counter转换为字符串
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // floatingActionButton是悬浮按钮
      floatingActionButton: FloatingActionButton(
        // onPressed是按钮点击事件回调
        onPressed: _incrementCounter,
        // tooltip是按钮长按显示的提示文本
        tooltip: '增加',
        // child是按钮内部的子组件
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation控制悬浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
