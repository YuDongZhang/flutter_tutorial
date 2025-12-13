// Flutter状态管理演示
import 'package:flutter/material.dart';

// 状态管理演示页面
class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            const Text(
              'Flutter状态管理示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 计数器示例
            _buildSectionTitle('1. 计数器示例（基础状态）'),
            const CounterExample(),
            const SizedBox(height: 20),

            // 2. 开关示例
            _buildSectionTitle('2. 开关示例（布尔状态）'),
            const SwitchExample(),
            const SizedBox(height: 20),

            // 3. 滑块示例
            _buildSectionTitle('3. 滑块示例（数值范围状态）'),
            const SliderExample(),
            const SizedBox(height: 20),

            // 4. 表单输入示例
            _buildSectionTitle('4. 表单输入示例（文本状态）'),
            const TextFieldExample(),
            const SizedBox(height: 20),

            // 5. 列表状态示例
            _buildSectionTitle('5. 列表状态示例（集合状态）'),
            const ListStateExample(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 构建section标题
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

// 1. 计数器示例
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  // 定义计数器状态变量
  int _count = 0;

  // 增加计数
  void _increment() {
    setState(() {
      _count++;
    });
  }

  // 减少计数
  void _decrement() {
    setState(() {
      _count--;
    });
  }

  // 重置计数
  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: Column(
        children: [
          Text(
            '计数: $_count',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _decrement, child: const Text('-')),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: _increment, child: const Text('+')),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: _reset, child: const Text('重置')),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '点击按钮改变计数，演示基础的setState使用',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 2. 开关示例
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  // 定义开关状态变量
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('开关状态演示'),
              Text(
                '当前状态: ${_isSwitched ? '开启' : '关闭'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Switch(
            value: _isSwitched,
            onChanged: (bool value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// 3. 滑块示例
class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  // 定义滑块值状态变量
  double _sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('滑块值:'),
              Text(
                _sliderValue.toStringAsFixed(1),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: 100.0,
            divisions: 100, // 分成100个小格
            label: _sliderValue.toStringAsFixed(0), // 显示整数标签
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// 4. 表单输入示例
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  // 定义文本输入状态变量
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 1),
      ),
      child: Column(
        children: [
          const Text('文本输入示例'),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              labelText: '请输入文本',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {
              setState(() {
                _inputText = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Text(
            '你输入的是: $_inputText',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// 5. 列表状态示例
class ListStateExample extends StatefulWidget {
  const ListStateExample({super.key});

  @override
  State<ListStateExample> createState() => _ListStateExampleState();
}

class _ListStateExampleState extends State<ListStateExample> {
  // 定义列表状态变量
  final List<String> _items = ['项目1', '项目2', '项目3'];

  // 添加新项
  void _addItem() {
    setState(() {
      _items.add('项目${_items.length + 1}');
    });
  }

  // 删除项
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('列表状态管理'),
              ElevatedButton(onPressed: _addItem, child: const Text('添加项目')),
            ],
          ),
          const SizedBox(height: 10),
          _items.isEmpty
              ? const Text('列表为空，点击添加按钮添加项目')
              : ListView.builder(
                  shrinkWrap: true, // 让ListView适应内容高度
                  physics: const NeverScrollableScrollPhysics(), // 禁止内部滚动
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_items[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
