
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state_manage_demo.dart';
import 'route_demo.dart';
import 'dependency_demo.dart';
import 'utils_demo.dart';

class GetXDemoPage extends StatelessWidget {
  const GetXDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 全功能演示'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.purple.shade50],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 3, // Web端宽屏展示3列
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.2,
          children: [
            _buildFeatureCard(
              context,
              title: '状态管理',
              subtitle: 'Obx, GetBuilder, GetX',
              icon: Icons.sync,
              color: Colors.blue,
              onTap: () => Get.to(() => const StateManagementDemo()),
            ),
            _buildFeatureCard(
              context,
              title: '路由管理',
              subtitle: 'Get.to, Get.toNamed',
              icon: Icons.directions,
              color: Colors.green,
              onTap: () => Get.to(() => const RouteDemo()),
            ),
            _buildFeatureCard(
              context,
              title: '依赖注入',
              subtitle: 'Put, LazyPut, Find',
              icon: Icons.memory,
              color: Colors.orange,
              onTap: () => Get.to(() => const DependencyInjectionDemo()),
            ),
            _buildFeatureCard(
              context,
              title: '工具 & UI',
              subtitle: 'Snackbar, Dialog, Theme',
              icon: Icons.build,
              color: Colors.purple,
              onTap: () => Get.to(() => const UtilsDemo()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
