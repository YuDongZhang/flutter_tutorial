// Flutter 异步组件示例
import 'dart:async';
import 'package:flutter/material.dart';

// 异步组件示例页面
class AsyncDemo extends StatelessWidget {
  const AsyncDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('异步组件示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '异步组件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. FutureBuilder 示例
            _buildSectionTitle('1. FutureBuilder（异步任务）'),
            _buildFutureBuilderExample(),
            const SizedBox(height: 20),

            // 2. StreamBuilder 示例
            _buildSectionTitle('2. StreamBuilder（数据流）'),
            _buildStreamBuilderExample(),
            const SizedBox(height: 20),

            // 3. FutureBuilder 错误处理示例
            _buildSectionTitle('3. FutureBuilder 错误处理'),
            _buildFutureBuilderErrorExample(),
            const SizedBox(height: 20),

            // 4. StreamBuilder 计数器示例
            _buildSectionTitle('4. StreamBuilder 实时计数器'),
            _buildStreamCounterExample(),
            const SizedBox(height: 20),

            // 5. 组合使用示例
            _buildSectionTitle('5. 异步组件组合使用'),
            _buildCombinedAsyncExample(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建 section 标题
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  // 1. FutureBuilder 示例
  Widget _buildFutureBuilderExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          const Text('FutureBuilder 用于处理异步任务，如网络请求：'),
          const SizedBox(height: 16),
          FutureBuilder<String>(
            // 模拟异步任务
            future: _fetchData(),
            // 初始数据
            initialData: '加载中...',
            builder: (context, snapshot) {
              // 根据快照状态返回不同的 UI
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('正在加载数据...'),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('错误: ${snapshot.error}'),
                );
              } else {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data ?? '无数据',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // FutureBuilder 会自动重建，无需手动刷新
            },
            child: const Text('重新加载数据'),
          ),
        ],
      ),
    );
  }

  // 模拟异步数据获取
  Future<String> _fetchData() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 2));
    return '这是从服务器获取的数据，使用 FutureBuilder 异步加载';
  }

  // 2. StreamBuilder 示例
  Widget _buildStreamBuilderExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          const Text('StreamBuilder 用于处理数据流，如实时更新：'),
          const SizedBox(height: 16),
          StreamBuilder<String>(
            // 创建数据流
            stream: _createStream(),
            // 初始数据
            initialData: '等待数据流...',
            builder: (context, snapshot) {
              // 根据快照状态返回不同的 UI
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('等待数据流...'));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('错误: ${snapshot.error}'),
                );
              } else {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text('数据流更新：'),
                        const SizedBox(height: 8),
                        Text(
                          snapshot.data ?? '无数据',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 8),
          const Text('数据流每秒钟会自动更新一次'),
        ],
      ),
    );
  }

  // 创建数据流
  Stream<String> _createStream() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (count) => '当前时间: ${DateTime.now().toLocal().toString()}',
    );
  }

  // 3. FutureBuilder 错误处理示例
  Widget _buildFutureBuilderErrorExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          const Text('FutureBuilder 错误处理示例：'),
          const SizedBox(height: 16),
          FutureBuilder<String>(
            // 模拟一个会出错的异步任务
            future: _fetchDataWithError(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('没有异步任务');
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Text('活跃状态');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Card(
                      color: Colors.red[50],
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Icon(Icons.error,
                                color: Colors.red, size: 48),
                            const SizedBox(height: 16),
                            Text(
                              '错误信息: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('重试'),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('成功: ${snapshot.data}');
                  }
              }
            },
          ),
        ],
      ),
    );
  }

  // 模拟一个会出错的异步任务
  Future<String> _fetchDataWithError() async {
    await Future.delayed(const Duration(seconds: 2));
    // 抛出错误
    throw Exception('模拟网络请求失败');
  }

  // 4. StreamBuilder 计数器示例
  Widget _buildStreamCounterExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          const Text('StreamBuilder 实时计数器：'),
          const SizedBox(height: 16),
          StreamBuilder<int>(
            // 使用 StreamController 创建自定义数据流
            stream: _counterStream(),
            initialData: 0,
            builder: (context, snapshot) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        '当前计数',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '计数状态: ${_getStreamStatus(snapshot.connectionState)}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 自定义计数器数据流
  Stream<int> _counterStream() {
    final controller = StreamController<int>();
    int count = 0;

    // 每秒发送一次计数
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      controller.add(count);
      // 计数到10后停止
      if (count >= 10) {
        timer.cancel();
        controller.close();
      }
    });

    return controller.stream;
  }

  // 获取流状态描述
  String _getStreamStatus(ConnectionState state) {
    switch (state) {
      case ConnectionState.none:
        return '无连接';
      case ConnectionState.waiting:
        return '等待中';
      case ConnectionState.active:
        return '活跃';
      case ConnectionState.done:
        return '已完成';
    }
  }

  // 5. 组合使用示例
  Widget _buildCombinedAsyncExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          const Text('异步组件组合使用：'),
          const SizedBox(height: 16),
          // 组合多个异步组件
          FutureBuilder<List<String>>(
            future: _fetchMultipleData(),
            builder: (context, listSnapshot) {
              if (listSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (listSnapshot.hasError) {
                return Text('错误: ${listSnapshot.error}');
              } else {
                final items = listSnapshot.data ?? [];
                return Column(
                  children: [
                    Text('获取到 ${items.length} 个项目：'),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(items[index]),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // 模拟获取多个数据
  Future<List<String>> _fetchMultipleData() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      '项目 1',
      '项目 2',
      '项目 3',
      '项目 4',
      '项目 5',
    ];
  }
}
