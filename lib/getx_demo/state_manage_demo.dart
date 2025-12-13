
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- Controllers ---

// Reactive Controller (for Obx/GetX)
class CounterController extends GetxController {
  // .obs makes the variable observable
  final count = 0.obs;

  void increment() => count.value++;
}

class UserProfileController extends GetxController {
  // Observable objects
  final name = "User".obs;
  final age = 25.obs;

  void updateUser() {
    name.value = "Super User";
    age.value = 30;
  }
}

// Simple Controller (for GetBuilder)
class SimpleController extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update(); // Manually trigger update
  }
}

// --- Demo Page ---

class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject controllers
    final CounterController counterC = Get.put(CounterController());
    final UserProfileController userC = Get.put(UserProfileController());
    final SimpleController simpleC = Get.put(SimpleController());

    return Scaffold(
      appBar: AppBar(title: const Text("GetX 状态管理")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSection(
              title: "1. 响应式状态管理 (Obx)",
              description: "使用 .obs 和 Obx()，当数据变化时自动刷新UI，无需手动 update()。",
              content: Column(
                children: [
                  Obx(() => Text(
                        "计数: ${counterC.count}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: counterC.increment,
                    icon: const Icon(Icons.add),
                    label: const Text("增加"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "2. 对象更新 (Obx)",
              description: "监听对象属性变化。",
              content: Column(
                children: [
                  Obx(() => Column(
                    children: [
                      Text("姓名: ${userC.name}", style: const TextStyle(fontSize: 18)),
                      Text("年龄: ${userC.age}", style: const TextStyle(fontSize: 18)),
                    ],
                  )),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: userC.updateUser,
                    child: const Text("更新资料"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "3. 简单状态管理 (GetBuilder)",
              description: "使用 update() 手动触发更新，内存占用更低。",
              content: GetBuilder<SimpleController>(
                builder: (controller) => Column(
                  children: [
                    Text(
                      "简单计数: ${controller.counter}",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade50),
                      onPressed: controller.increment,
                      icon: const Icon(Icons.exposure_plus_1, color: Colors.purple),
                      label: const Text("增加 (update)", style: TextStyle(color: Colors.purple)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String description, required Widget content}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const Divider(height: 20),
            Center(child: content),
          ],
        ),
      ),
    );
  }
}
