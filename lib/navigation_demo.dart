
// Flutter导航组件演示
import 'package:flutter/material.dart';

// 导航演示主页面
class NavigationDemo extends StatefulWidget {
  const NavigationDemo({super.key});

  @override
  State<NavigationDemo> createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {
  // 当前选中的底部导航栏索引
  int _selectedIndex = 0;

  // 底部导航栏页面列表
  final List<Widget> _bottomNavPages = [
    const HomePage(),
    const SettingsPage(),
  ];

  // 处理底部导航栏点击
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导航组件演示'),
      ),
      // 侧边栏抽屉
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '侧边栏导航',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('首页'),
              onTap: () {
                Navigator.pop(context); // 关闭抽屉
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('设置'),
              onTap: () {
                Navigator.pop(context); // 关闭抽屉
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('关于'),
              onTap: () {
                Navigator.pop(context); // 关闭抽屉
                // 导航到关于页面
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex < _bottomNavPages.length ? _bottomNavPages[_selectedIndex] : const HomePage(),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '首页',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // 基本导航按钮
          ElevatedButton(
            onPressed: () {
              // 使用Navigator.push导航到新页面
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text('基本页面跳转'),
          ),
          const SizedBox(height: 10),
          // 带参数的导航按钮
          ElevatedButton(
            onPressed: () {
              // 传递参数
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(itemId: '123', title: '示例项目'),
                ),
              );
            },
            child: const Text('带参数的页面跳转'),
          ),
          const SizedBox(height: 10),
          // 返回数据的导航按钮
          ElevatedButton(
            onPressed: () {
              // 使用Navigator.push的then方法替代async/await，避免context在async gap中使用
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SelectionPage()),
              ).then((result) {
                // 显示返回结果
                if (result != null) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('选择了: $result')),
                  );
                }
              });
            },
            child: const Text('返回数据的页面跳转'),
          ),
        ],
      ),
    );
  }
}

// 第二页
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('这是第二页'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 使用Navigator.pop返回上一页
                Navigator.pop(context);
              },
              child: const Text('返回首页'),
            ),
          ],
        ),
      ),
    );
  }
}

// 详情页（带参数）
class DetailPage extends StatelessWidget {
  // 接收参数
  const DetailPage({super.key, required this.itemId, required this.title});

  // 定义参数
  final String itemId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('项目ID: $itemId', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('这是带参数的详情页面，展示了如何在页面间传递数据。'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

// 选择页（返回数据）
class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择页面'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('选项A'),
            onTap: () {
              // 返回数据并关闭页面
              Navigator.pop(context, '选项A');
            },
          ),
          ListTile(
            title: const Text('选项B'),
            onTap: () {
              Navigator.pop(context, '选项B');
            },
          ),
          ListTile(
            title: const Text('选项C'),
            onTap: () {
              Navigator.pop(context, '选项C');
            },
          ),
        ],
      ),
    );
  }
}

// 设置页面
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        '设置页面',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// 关于页面
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Flutter导航示例', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('版本: 1.0.0'),
            const SizedBox(height: 10),
            const Text('这是一个展示Flutter导航功能的示例应用。'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}
