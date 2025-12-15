import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'user_bloc.dart';

class BlocDemoPage extends StatelessWidget {
  const BlocDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider 用于在组件树中注入多个 Bloc/Cubit
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("BLoC 全面演示")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BLoC (Business Logic Component) 是一种将业务逻辑与UI分离的设计模式。\n"
                "Flutter Bloc 是其官方推荐的实现库。",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Divider(height: 30),

              // 演示 Cubit (简单状态)
              const _SectionTitle("1. Cubit (简单状态管理)"),
              const CubitSection(),

              const Divider(height: 30),

              // 演示 BLoC (事件驱动)
              const _SectionTitle("2. BLoC (事件驱动架构)"),
              const BlocSection(),
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
// 子组件：Cubit 演示
// ----------------------------------------------------------------------------

class CubitSection extends StatelessWidget {
  const CubitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("CounterCubit", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    // context.read<T>(): 获取 Cubit 实例来调用方法
                    context.read<CounterCubit>().decrement();
                  },
                ),
                const SizedBox(width: 20),
                // BlocBuilder<Bloc, State>:
                // 监听状态变化并重建 UI
                BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return Text(
                      "$count",
                      style: const TextStyle(fontSize: 32, color: Colors.blue),
                    );
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterCubit>().increment();
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

// ----------------------------------------------------------------------------
// 子组件：BLoC 演示
// ----------------------------------------------------------------------------

class BlocSection extends StatelessWidget {
  const BlocSection({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocConsumer: 同时具备 Listener 和 Builder 的功能
    // listener: 用于副作用 (如显示 SnackBar, 导航等)，不会重建 UI
    // builder: 用于根据状态构建 UI
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is UserLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("用户加载成功!"), duration: Duration(seconds: 1)),
          );
        }
      },
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (state is UserInitial) ...[
                  const Text("点击下方按钮加载用户数据"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // context.read<Bloc>().add(Event): 发送事件
                      context.read<UserBloc>().add(LoadUser());
                    },
                    child: const Text("Load User"),
                  ),
                ] else if (state is UserLoading) ...[
                  const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  const Text("正在加载..."),
                ] else if (state is UserLoaded) ...[
                  Row(
                    children: [
                      const CircleAvatar(child: Icon(Icons.person)),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${state.name}", style: const TextStyle(fontSize: 16)),
                          Text("Age: ${state.age}", style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<UserBloc>().add(const UpdateUserName("Dart Expert"));
                        },
                        child: const Text("Update Name"),
                      ),
                      TextButton(
                        onPressed: () {
                          // 重新加载
                          context.read<UserBloc>().add(LoadUser());
                        },
                        child: const Text("Reload"),
                      ),
                    ],
                  )
                ] else if (state is UserError) ...[
                   Column(
                     children: [
                       const Icon(Icons.error, color: Colors.red, size: 40),
                       Text(state.message),
                       const SizedBox(height: 10),
                       ElevatedButton(
                         onPressed: () => context.read<UserBloc>().add(LoadUser()),
                         child: const Text("Retry"),
                       ),
                     ],
                   )
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
