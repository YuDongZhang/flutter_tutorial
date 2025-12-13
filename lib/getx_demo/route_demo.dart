
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteDemo extends StatelessWidget {
  const RouteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX 路由管理")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSection(
              title: "普通路由跳转",
              description: "使用 Get.to() 进行页面跳转。",
              content: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SecondPage());
                },
                child: const Text("跳转到下一页"),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "带参数跳转",
              description: "使用 arguments 传递对象。",
              content: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const ArgumentPage(),
                    arguments: "Hello from RouteDemo!",
                    transition: Transition.zoom, // 演示转场动画
                  );
                },
                child: const Text("带参数跳转 (Zoom动画)"),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "Snackbar, BottomSheet 等无需Context",
              description: "GetX 允许在任何地方打开这些覆盖层，不需要Context。",
              content: Wrap(
                spacing: 10,
                children: [
                   ActionChip(
                     label: const Text("返回上页"),
                     onPressed: () => Get.back(),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String description, required Widget content}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 15),
            Center(child: content),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("第二页")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text("返回 (Get.back)"),
        ),
      ),
    );
  }
}

class ArgumentPage extends StatelessWidget {
  const ArgumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取传递的参数
    final dynamic args = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text("参数页面")),
      backgroundColor: Colors.amber.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mark_email_read, size: 60, color: Colors.amber),
            const SizedBox(height: 20),
            const Text("接收到的参数:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              args.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("返回"),
            ),
          ],
        ),
      ),
    );
  }
}
