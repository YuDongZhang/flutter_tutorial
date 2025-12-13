
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsDemo extends StatelessWidget {
  const UtilsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX 工具 & UI")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildItem(
            icon: Icons.notifications_active,
            color: Colors.blue,
            title: "Snackbar",
            desc: "Get.snackbar() - 顶部通知",
            onTap: () {
              Get.snackbar(
                "友情提示",
                "这是一个 GetX 的 Snackbar，非常简单！",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.blue.withOpacity(0.5),
                colorText: Colors.white,
                icon: const Icon(Icons.info, color: Colors.white),
              );
            },
          ),
          _buildItem(
            icon: Icons.question_answer,
            color: Colors.orange,
            title: "Default Dialog",
            desc: "Get.defaultDialog() - 默认弹窗",
            onTap: () {
              Get.defaultDialog(
                title: "确认操作",
                middleText: "你确定要删除这条记录吗？这是一个演示对话框。",
                textConfirm: "确定",
                textCancel: "取消",
                confirmTextColor: Colors.white,
                onConfirm: () => Get.back(),
                onCancel: () {},
              );
            },
          ),
          _buildItem(
            icon: Icons.vertical_align_bottom,
            color: Colors.green,
            title: "Bottom Sheet",
            desc: "Get.bottomSheet() - 底部弹层",
            onTap: () {
              Get.bottomSheet(
                Container(
                  height: 200,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.wb_sunny),
                        title: const Text("亮色模式"),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.nightlight_round),
                        title: const Text("暗色模式"),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          _buildItem(
            icon: Icons.palette,
            color: Colors.purple,
            title: "切换主题",
            desc: "Get.changeTheme() - 动态切换",
            onTap: () {
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
