import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ----------------------------------------------------------------------------
// 1. Models (数据模型)
// ----------------------------------------------------------------------------

/// 计数器模型
/// 继承 ChangeNotifier，用于通知监听者（Listeners）状态的变化
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    // 关键：通知所有监听者刷新
    notifyListeners();
  }
}

/// 用户模型
/// 演示包含多个字段的复杂对象
class UserModel extends ChangeNotifier {
  String _name = "Guest";
  int _age = 18;

  String get name => _name;
  int get age => _age;

  void updateName(String newName) {
    if (_name != newName) {
      _name = newName;
      notifyListeners();
    }
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }
}

// ----------------------------------------------------------------------------
// 2. Main Page (主页面)
// ----------------------------------------------------------------------------

class ProviderDemoPage extends StatelessWidget {
  const ProviderDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider 用于在组件树上挂载多个 Provider
    // 通常放在 main.dart 或某个功能模块的根部
    return MultiProvider(
      providers: [
        // 注册 CounterModel
        ChangeNotifierProvider(create: (_) => CounterModel()),
        // 注册 UserModel
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("Provider 全面演示")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Provider 是 Flutter 官方推荐的状态管理库。\n以下演示 Consumer, Selector 以及 Provider.of 的用法。",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 30),
              
              // 演示 Consumer
              const _SectionTitle("1. Consumer (自动重建)"),
              const CounterView(),
              
              const Divider(height: 30),

              // 演示 Selector
              const _SectionTitle("2. Selector (精准刷新)"),
              const UserView(),
              
              const Divider(height: 30),

              // 演示 Provider.of(listen: false)
              const _SectionTitle("3. Controller (事件触发)"),
              const ControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ----------------------------------------------------------------------------
// 3. Sub Widgets (子组件)
// ----------------------------------------------------------------------------

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer<T>:
    // 当 T 发生变化时，builder 会被调用。
    // 优点：可以在 widget 树的很深处获取数据，且只重建 builder 包裹的部分。
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CounterModel>(
          builder: (context, counter, child) {
            return Row(
              children: [
                const Icon(Icons.timer, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "当前计数: ${counter.count}",
                  style: const TextStyle(fontSize: 20),
                ),
                // child 参数优化：
                // 如果这部分 UI 不需要重绘（比如固定的 Label），可以传进来
                if (child != null) child,
              ],
            );
          },
          // 这是传入 builder 的 child 参数，它不会因为 count 变化而重绘
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("(Consumer 演示)", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    // Selector<A, S>:
    // 从 A 类型的数据中选择 S 类型的数据。
    // 只有当 S 发生变化时（默认用 == 比较），builder 才会重新运行。
    // 非常适合防止因无关属性变化导致的重建 (例如这里 age 变了 name 没变，就不会刷新)。
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 演示1：监听 name 变化
            Selector<UserModel, String>(
              selector: (context, user) => user.name,
              builder: (context, name, child) {
                print("Selector: name rebuilt ($name)"); // 仅 Name 变时打印
                return Row(
                  children: [
                    const Icon(Icons.person, color: Colors.orange),
                    const SizedBox(width: 10),
                    Text("用户姓名: $name", style: const TextStyle(fontSize: 18)),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            // 演示2：监听 age 变化 (Consumer 写法对比)
            Consumer<UserModel>(
              builder: (context, user, child) {
                print("Consumer: age rebuilt (${user.age})"); // Name 变时这里也会执行
                return Row(
                  children: [
                    const Icon(Icons.cake, color: Colors.pink),
                    const SizedBox(width: 10),
                    Text("用户年龄: ${user.age}", style: const TextStyle(fontSize: 18)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("计数+1"),
              onPressed: () {
                // Provider.of<T>(context, listen: false)
                // 获取数据但不监听变化。
                // 这种方式最适合在事件回调中使用 (onPressed), 避免不必要的 Widget 重建。
                Provider.of<CounterModel>(context, listen: false).increment();
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("改名为 Alice"),
              onPressed: () {
                 context.read<UserModel>().updateName("Alice");
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("改名为 Bob"),
              onPressed: () {
                 // context.read<T>() 等价于 Provider.of<T>(context, listen: false)
                 context.read<UserModel>().updateName("Bob");
              },
            ),
             ElevatedButton.icon(
              icon: const Icon(Icons.cake_outlined),
              label: const Text("年龄+1"),
              onPressed: () {
                 context.read<UserModel>().incrementAge();
              },
            ),
          ],
        )
      ],
    );
  }
}
