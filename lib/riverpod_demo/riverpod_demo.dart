import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ============================================================================
// 1. Providers (全局定义)
// ============================================================================

/// StateProvider: 最简单的状态管理，适合单一值
/// 相当于 Provider 中的 ValueNotifier
final counterProvider = StateProvider<int>((ref) => 0);

/// StateNotifierProvider: 复杂状态的管理，适合需要多个操作的场景
/// 需要配合 StateNotifier 使用
final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList();
});

/// FutureProvider: 异步数据获取，自动处理 loading/error 状态
final weatherProvider = FutureProvider<String>((ref) async {
  // 模拟网络延迟
  await Future.delayed(const Duration(seconds: 2));
  // 模拟返回数据
  return "今日天气: 晴朗 ☀️ 25°C";
});

/// FutureProvider.autoDispose: 自动销毁，使用场景：页面级别的数据
final autoDisposeWeatherProvider = FutureProvider.autoDispose<String>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return "实时更新: 晴 ${DateTime.now().second}秒";
});

// ============================================================================
// 2. StateNotifier (复杂状态类)
// ============================================================================

class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  Todo copyWith({String? title, bool? completed}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([
    Todo(id: '1', title: '学习 Riverpod'),
    Todo(id: '2', title: '完成 Flutter 项目'),
  ]);

  void add(String title) {
    // 使用不可变更新
    state = [...state, Todo(id: DateTime.now().toString(), title: title)];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// ============================================================================
// 3. Main Page (主页面)
// ============================================================================

class RiverpodDemoPage extends StatelessWidget {
  const RiverpodDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ProviderScope 是 Riverpod 的核心，
    // 它必须包裹在使用 Riverpod 的 Widget 树的最外层
    // 通常放在 main.dart 的 runApp 中，但这里为了演示单独包裹
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(title: const Text("Riverpod 全面演示")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Riverpod 是 Provider 的进化版，更安全、更灵活。\n"
                "支持编译时安全、自动销毁、无需 context 等特性。",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 30),

              // 演示 StateProvider
              const _SectionTitle("1. StateProvider (简单状态)"),
              const CounterSection(),

              const Divider(height: 30),

              // 演示 StateNotifierProvider
              const _SectionTitle("2. StateNotifierProvider (复杂状态)"),
              const TodoSection(),

              const Divider(height: 30),

              // 演示 FutureProvider
              const _SectionTitle("3. FutureProvider (异步数据)"),
              const AsyncSection(),
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

// ============================================================================
// 4. Sub Widgets (子组件)
// ============================================================================

class CounterSection extends ConsumerWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch: 监听状态变化，状态变化时 Widget 会重建
    final count = ref.watch(counterProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("计数: $count", style: const TextStyle(fontSize: 24)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    // ref.read: 获取当前值，不监听变化 (适合事件回调)
                    // .notifier 获取 StateProvider 的 StateController
                    ref.read(counterProvider.notifier).state--;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TodoSection extends ConsumerWidget {
  const TodoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...todos.map((todo) => ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) {
                      // 调用 notifier 上的方法
                      ref.read(todoListProvider.notifier).toggle(todo.id);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(todoListProvider.notifier).remove(todo.id);
                    },
                  ),
                )),
            const Divider(),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("添加新任务"),
              onPressed: () {
                ref.read(todoListProvider.notifier).add("新任务 ${todos.length + 1}");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AsyncSection extends ConsumerWidget {
  const AsyncSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProvider 返回 AsyncValue，包含 loading/data/error 三种状态
    final weatherAsync = ref.watch(weatherProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("天气信息 (模拟网络请求):", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // AsyncValue.when: 优雅处理三种状态
            weatherAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text("错误: $err", style: const TextStyle(color: Colors.red)),
              data: (weather) => Text(weather, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("刷新 (invalidate)"),
              onPressed: () {
                // ref.invalidate: 强制重新获取数据
                ref.invalidate(weatherProvider);
              },
            ),
          ],
        ),
      ),
    );
  }
}
