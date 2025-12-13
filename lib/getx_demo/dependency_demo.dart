
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- Services/Controllers ---

class ApiService extends GetxService {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    return "数据加载成功 (Timestamp: ${DateTime.now().second})";
  }
}

class LazyController extends GetxController {
  LazyController() {
    print("LazyController 初始化!");
  }
  final value = "我是懒加载的Controller".obs;
}

// --- Demo Page ---

class DependencyInjectionDemo extends StatefulWidget {
  const DependencyInjectionDemo({super.key});

  @override
  State<DependencyInjectionDemo> createState() => _DependencyInjectionDemoState();
}

class _DependencyInjectionDemoState extends State<DependencyInjectionDemo> {
  @override
  void initState() {
    super.initState();
    // Put: 立即注入
    Get.put(ApiService());
    // LazyPut: 使用时才注入
    Get.lazyPut(() => LazyController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("依赖注入 (DI)")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSection(
              title: "1. Get.put (立即注入)",
              description: "Service在页面加载时就已经初始化。",
              content: FutureBuilder<String>(
                future: Get.find<ApiService>().fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    "${snapshot.data}",
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "2. Get.lazyPut (懒加载)",
              description: "Controller 只有在第一次被 find 使用时才会被初始化。",
              content: Column(
                children: [
                  const Text("点击下方按钮查找 LazyController"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // 第一次调用 find 时，LazyController 才会初始化
                      final controller = Get.find<LazyController>();
                      Get.snackbar("成功", "获取到值: ${controller.value}");
                    },
                    child: const Text("Get.find<LazyController>()"),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 20),
            _buildSection(
              title: "3. Get.find",
              description: "在应用任何地方获取已注入的实例。",
              content: const Text("Get.find<T>() 是获取实例的核心方法"),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const Divider(),
            Center(child: content),
          ],
        ),
      ),
    );
  }
}
