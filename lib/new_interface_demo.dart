import 'package:flutter/material.dart';

// 新界面示例
class NewInterfaceDemo extends StatelessWidget {
  const NewInterfaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新界面示例 - 参数传递演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 说明卡片
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📋 参数传递说明',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '在Flutter中，页面间传递参数有几种方式：',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    _buildParameterMethod(
                      '1. 构造函数传参',
                      '通过目标页面的构造函数传递参数',
                      Icons.arrow_forward,
                    ),
                    const SizedBox(height: 8),
                    _buildParameterMethod(
                      '2. RouteSettings传参',
                      '使用MaterialPageRoute的settings属性',
                      Icons.settings,
                    ),
                    const SizedBox(height: 8),
                    _buildParameterMethod(
                      '3. 状态管理传参',
                      '使用Provider、Riverpod等状态管理方案',
                      Icons.storage,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 演示按钮区域
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '🚀 参数传递演示',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // 基本参数传递
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParameterDemoPage(
                              title: '构造函数传参',
                              message: '这是通过构造函数传递的参数',
                              count: 42,
                            ),
                          ),
                        );
                      },
                      child: const Text('构造函数传参演示'),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        // 传递对象参数
                        final userData = UserData(
                          name: '张三',
                          age: 25,
                          email: 'zhangsan@example.com',
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ObjectParameterPage(
                              userData: userData,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('对象参数传递演示'),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        // 返回结果演示
                        _showReturnResultDemo(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('返回结果演示'),
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

  Widget _buildParameterMethod(
      String title, String description, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showReturnResultDemo(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReturnResultPage(),
      ),
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('接收到的返回结果: $result'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

// 用户数据模型
class UserData {
  final String name;
  final int age;
  final String email;

  UserData({
    required this.name,
    required this.age,
    required this.email,
  });
}

// 构造函数参数传递演示页面
class ParameterDemoPage extends StatelessWidget {
  final String title;
  final String message;
  final int count;

  const ParameterDemoPage({
    super.key,
    required this.title,
    required this.message,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info, size: 48, color: Colors.blue),
                const SizedBox(height: 16),
                Text(
                  '接收到的参数：',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _buildParameterRow('消息', message),
                _buildParameterRow('数量', count.toString()),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('返回'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParameterRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

// 对象参数传递演示页面
class ObjectParameterPage extends StatelessWidget {
  final UserData userData;

  const ObjectParameterPage({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('对象参数传递'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, size: 48, color: Colors.orange),
                const SizedBox(height: 16),
                Text(
                  '用户信息',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _buildUserInfoRow('姓名', userData.name),
                _buildUserInfoRow('年龄', userData.age.toString()),
                _buildUserInfoRow('邮箱', userData.email),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('返回'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text('$label: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// 返回结果演示页面
class ReturnResultPage extends StatelessWidget {
  const ReturnResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('返回结果演示'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.reply, size: 48, color: Colors.green),
                const SizedBox(height: 16),
                Text(
                  '选择一个结果返回',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, '成功'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('返回成功'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, '失败'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('返回失败'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('不返回结果'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
