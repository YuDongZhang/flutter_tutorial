
// Flutter 官方布局文档示例 - 列表布局
import 'package:flutter/material.dart';

// 列表布局示例页面
class ListExamples extends StatelessWidget {
  const ListExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表布局示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '列表布局示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 横向列表
            _buildSectionTitle('1. 横向列表', 'Horizontal ListView'),
            _buildHorizontalList(),
            const SizedBox(height: 20),

            // 2. 网格视图
            _buildSectionTitle('2. 网格视图', 'GridView Widget'),
            _buildGridView(),
            const SizedBox(height: 20),

            // 3. 不同类型元素列表
            _buildSectionTitle('3. 不同类型元素列表', 'Mixed Type ListView'),
            _buildMixedTypeList(),
            const SizedBox(height: 20),

            // 4. 间隔列表
            _buildSectionTitle('4. 带间隔的列表', 'Separated ListView'),
            _buildSpacedList(),
            const SizedBox(height: 20),

            // 5. 长列表
            _buildSectionTitle('5. 长列表', 'Long ListView'),
            _buildLongList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建 section 标题，中英文对照
  Widget _buildSectionTitle(String chineseTitle, [String? englishTitle]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chineseTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        if (englishTitle != null) 
          Text(
            englishTitle,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
      ],
    );
  }

  // 1. 横向列表
  Widget _buildHorizontalList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }

  // 2. 网格视图
  Widget _buildGridView() {
    return SizedBox(
      height: 300,
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: List.generate(15, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(fontSize: 18),
            ),
          );
        }),
      ),
    );
  }

  // 3. 不同类型元素列表
  Widget _buildMixedTypeList() {
    // 模拟混合数据
    final List<dynamic> items = [
      {'type': 'text', 'content': '文本类型元素 1'}, 
      {'type': 'image', 'content': '图片类型元素 1'},
      {'type': 'text', 'content': '文本类型元素 2'},
      {'type': 'button', 'content': '按钮类型元素 1'},
      {'type': 'image', 'content': '图片类型元素 2'},
      {'type': 'text', 'content': '文本类型元素 3'},
    ];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          
          switch (item['type']) {
            case 'text':
              return ListTile(
                title: Text(item['content']),
                leading: const Icon(Icons.text_fields),
              );
            case 'image':
              return ListTile(
                title: Text(item['content']),
                leading: const Icon(Icons.image),
                tileColor: Colors.grey[100],
              );
            case 'button':
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(item['content']),
                ),
              );
            default:
              return ListTile(title: Text('未知类型'));
          }
        },
      ),
    );
  }

  // 4. 带间隔的列表
  Widget _buildSpacedList() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('带间隔的列表项 ${index + 1}'),
            subtitle: Text('这是第 ${index + 1} 个列表项，展示分隔线效果'),
            leading: CircleAvatar(
              backgroundColor: Colors.orange[100],
              child: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }

  // 5. 长列表
  Widget _buildLongList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        // 懒加载，只构建可见的列表项
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('长列表项 ${index + 1}'),
            subtitle: Text('这是长列表中的第 ${index + 1} 项，共 100 项'),
            leading: const Icon(Icons.list),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
