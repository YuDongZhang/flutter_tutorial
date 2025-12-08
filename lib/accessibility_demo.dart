// Flutter 无障碍功能示例
import 'package:flutter/material.dart';

// 无障碍功能示例页面
class AccessibilityDemo extends StatelessWidget {
  const AccessibilityDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('无障碍功能示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '无障碍功能示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. Semantics 示例
            _buildSectionTitle('1. Semantics 组件'),
            _buildSemanticsExample(),
            const SizedBox(height: 20),

            // 2. ExcludeSemantics 示例
            _buildSectionTitle('2. ExcludeSemantics 组件'),
            _buildExcludeSemanticsExample(),
            const SizedBox(height: 20),

            // 3. MergeSemantics 示例
            _buildSectionTitle('3. MergeSemantics 组件'),
            _buildMergeSemanticsExample(),
            const SizedBox(height: 20),

            // 4. Tooltip 示例
            _buildSectionTitle('4. Tooltip 组件'),
            _buildTooltipExample(),
            const SizedBox(height: 20),

            // 5. 焦点管理示例
            _buildSectionTitle('5. 焦点管理'),
            _buildFocusExample(),
            const SizedBox(height: 20),

            // 6. 高对比度示例
            _buildSectionTitle('6. 高对比度模式'),
            _buildHighContrastExample(),
            const SizedBox(height: 20),

            // 7. SemanticsService 示例
            _buildSectionTitle('7. SemanticsService 示例'),
            _buildSemanticsServiceExample(),
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

  // 1. Semantics 示例
  Widget _buildSemanticsExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          const Text('Semantics 组件用于添加语义信息，帮助屏幕阅读器理解UI内容：'),
          const SizedBox(height: 10),
          Semantics(
            // 描述组件的作用
            label: '增加按钮',
            // 描述组件的状态
            hint: '点击增加计数器',
            // 标记为可点击
            button: true,
            // 标记为启用状态
            enabled: true,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('增加'),
            ),
          ),
          const SizedBox(height: 10),
          Semantics(
            label: '计数器显示',
            value: '当前值为 0',
            child: const Text('0', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }

  // 2. ExcludeSemantics 示例
  Widget _buildExcludeSemanticsExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          const Text('ExcludeSemantics 组件用于从语义树中排除子树，适合装饰性元素：'),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('用户名：'),
              const SizedBox(width: 10),
              const TextField(
                decoration: InputDecoration(hintText: '请输入用户名'),
              ),
              const SizedBox(width: 10),
              ExcludeSemantics(
                // 排除装饰性图标，不影响屏幕阅读器
                child: Icon(Icons.info, color: Colors.grey[500]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 3. MergeSemantics 示例
  Widget _buildMergeSemanticsExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          const Text('MergeSemantics 组件用于合并子组件的语义信息：'),
          const SizedBox(height: 10),
          MergeSemantics(
            child: Row(
              children: [
                const Checkbox(value: false, onChanged: null),
                const SizedBox(width: 10),
                const Text('同意用户协议'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text('屏幕阅读器会将复选框和文本视为一个整体'),
        ],
      ),
    );
  }

  // 4. Tooltip 示例
  Widget _buildTooltipExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          const Text('Tooltip 组件用于显示悬停提示信息：'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tooltip(
                message: '保存',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                ),
              ),
              Tooltip(
                message: '编辑',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ),
              Tooltip(
                message: '删除',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ),
              Tooltip(
                message: '分享',
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 5. 焦点管理示例
  Widget _buildFocusExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        children: [
          const Text('焦点管理，支持键盘导航：'),
          const SizedBox(height: 10),
          FocusScope(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(hintText: '输入框 1'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(hintText: '输入框 2'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(hintText: '输入框 3'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('提交'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text('使用 Tab 键可以在输入框之间导航'),
        ],
      ),
    );
  }

  // 6. 高对比度模式示例
  Widget _buildHighContrastExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          const Text('支持高对比度模式，适应系统设置：'),
          const SizedBox(height: 10),
          Builder(
            builder: (context) {
              // 检测系统是否启用高对比度模式
              final highContrastEnabled = MediaQuery.of(context).highContrast;

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: highContrastEnabled ? Colors.black : Colors.teal[300],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: highContrastEnabled ? Colors.white : Colors.teal,
                    width: highContrastEnabled ? 2 : 1,
                  ),
                ),
                child: Text(
                  highContrastEnabled ? '高对比度模式已启用' : '正常对比度模式',
                  style: TextStyle(
                    color: highContrastEnabled ? Colors.white : Colors.black,
                    fontWeight: highContrastEnabled
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // 7. 无障碍通知示例
  Widget _buildSemanticsServiceExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo, width: 2),
      ),
      child: Column(
        children: [
          const Text('无障碍通知示例：'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // 使用 ScaffoldMessenger 显示提示
              // 在实际应用中，可以结合语义化组件提供更好的无障碍支持
              // 例如使用 Semantics 组件包装按钮，提供更详细的语义信息
            },
            child: Semantics(
              label: '发送成功通知',
              hint: '点击后会发送操作成功的无障碍通知',
              button: true,
              child: const Text('发送通知'),
            ),
          ),
          const SizedBox(height: 10),
          const Text('使用语义化组件包装UI元素，提供更详细的无障碍信息'),
        ],
      ),
    );
  }
}
