// Flutter 输入控件示例
import 'package:flutter/material.dart';

// 输入控件示例页面
class InputDemo extends StatelessWidget {
  const InputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('输入控件示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '输入控件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 文本输入控件
            _buildSectionTitle('1. 文本输入控件'),
            const _TextFieldExamples(),
            const SizedBox(height: 20),

            // 2. 选择控件
            _buildSectionTitle('2. 选择控件'),
            const _SelectionControlsExamples(),
            const SizedBox(height: 20),

            // 3. 按钮控件
            _buildSectionTitle('3. 按钮控件'),
            const _ButtonExamples(),
            const SizedBox(height: 20),

            // 4. 滑块和范围选择器
            _buildSectionTitle('4. 滑块和范围选择器'),
            const _SliderExamples(),
            const SizedBox(height: 20),

            // 5. 日期和时间选择器
            _buildSectionTitle('5. 日期和时间选择器'),
            const _DateTimePickerExamples(),
            const SizedBox(height: 20),

            // 6. 触摸手势控件
            _buildSectionTitle('6. 触摸手势控件'),
            const _GestureExamples(),
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
}

// 1. 文本输入控件示例
class _TextFieldExamples extends StatefulWidget {
  const _TextFieldExamples();

  @override
  State<_TextFieldExamples> createState() => _TextFieldExamplesState();
}

class _TextFieldExamplesState extends State<_TextFieldExamples> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _displayName = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          // 基础文本输入 - TextField
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: TextField - 基础文本输入框'),
              const SizedBox(height: 4),
              TextField(
                decoration: const InputDecoration(
                  labelText: '基础文本输入',
                  border: OutlineInputBorder(),
                  hintText: '请输入文本',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 带控制器的文本输入 - TextFormField
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: TextFormField - 带验证的文本输入框'),
              const SizedBox(height: 4),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: '带控制器的文本输入',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: '请输入邮箱',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入邮箱';
                  }
                  if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value)) {
                    return '请输入有效的邮箱地址';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 密码输入 - TextField with obscureText
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: TextField (obscureText: true) - 密码输入框'),
              const SizedBox(height: 4),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '密码输入',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: '请输入密码',
                ),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 多行文本输入 - TextField with maxLines
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: TextField (maxLines/minLines) - 多行文本输入框'),
              const SizedBox(height: 4),
              TextField(
                decoration: const InputDecoration(
                  labelText: '多行文本输入',
                  border: OutlineInputBorder(),
                  hintText: '请输入多行文本',
                ),
                maxLines: 3,
                minLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 带表单验证的文本输入 - Form + TextFormField
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: Form + TextFormField - 表单验证输入'),
              const SizedBox(height: 4),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '表单验证',
                        border: OutlineInputBorder(),
                        hintText: '请输入显示名称',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入显示名称';
                        }
                        if (value.length < 3) {
                          return '显示名称至少需要3个字符';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _displayName = value!;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('提交成功: $_displayName')),
                          );
                        }
                      },
                      child: const Text('提交表单'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 2. 选择控件示例
class _SelectionControlsExamples extends StatefulWidget {
  const _SelectionControlsExamples();

  @override
  State<_SelectionControlsExamples> createState() =>
      _SelectionControlsExamplesState();
}

class _SelectionControlsExamplesState
    extends State<_SelectionControlsExamples> {
  // 下拉菜单状态
  String? _dropdownValue = '选项1';
  final List<String> _dropdownItems = ['选项1', '选项2', '选项3', '选项4'];

  // 复选框状态
  bool _isChecked1 = false;
  bool _isChecked2 = true;

  // 单选按钮状态
  String? _radioValue = '选项A';
  final List<String> _radioItems = ['选项A', '选项B', '选项C'];

  // 开关状态
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          // 下拉菜单 - DropdownButtonFormField
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: DropdownButtonFormField - 下拉选择框'),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                decoration: const InputDecoration(
                  labelText: '下拉菜单',
                  border: OutlineInputBorder(),
                ),
                items: _dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 复选框 - Checkbox
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: Checkbox - 复选框'),
              const SizedBox(height: 4),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                    },
                  ),
                  const Text('选项1'),
                  const SizedBox(width: 16),
                  Checkbox(
                    value: _isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked2 = value!;
                      });
                    },
                  ),
                  const Text('选项2'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 复选框列表项 - CheckboxListTile
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: CheckboxListTile - 复选框列表项'),
              const SizedBox(height: 4),
              CheckboxListTile(
                title: const Text('复选框列表项'),
                subtitle: const Text('这是一个带标题和副标题的复选框'),
                value: _isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked1 = value!;
                  });
                },
                secondary: const Icon(Icons.check_box),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 单选按钮 - Radio
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: Radio - 单选按钮'),
              const SizedBox(height: 4),
              Row(
                children: _radioItems.map((String value) {
                  return Row(
                    children: [
                      Radio<String>(
                        value: value,
                        groupValue: _radioValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            _radioValue = newValue;
                          });
                        },
                      ),
                      Text(value),
                      const SizedBox(width: 8),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 单选按钮列表项 - RadioListTile
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: RadioListTile - 单选按钮列表项'),
              const SizedBox(height: 4),
              RadioListTile<String>(
                title: const Text('单选按钮列表项'),
                subtitle: const Text('这是一个带标题和副标题的单选按钮'),
                value: '选项D',
                groupValue: _radioValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _radioValue = newValue;
                  });
                },
                secondary: const Icon(Icons.radio_button_checked),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 开关 - Switch
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('控件: Switch - 开关控件'),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('开关状态'),
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
            ],
          ),
        ],
      ),
    );
  }
}

// 3. 按钮控件示例
class _ButtonExamples extends StatelessWidget {
  const _ButtonExamples();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          // 按钮控件说明
          const Text(
            '控件: ElevatedButton, TextButton, OutlinedButton - 各种按钮类型',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 按钮行1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 悬浮按钮
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('悬浮按钮被点击')),
                  );
                },
                child: const Text('悬浮按钮'),
              ),

              // 文本按钮
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('文本按钮被点击')),
                  );
                },
                child: const Text('文本按钮'),
              ),

              // 描边按钮
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('描边按钮被点击')),
                  );
                },
                child: const Text('描边按钮'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 带图标的按钮控件说明
          const Text(
            '控件: ElevatedButton.icon, TextButton.icon, OutlinedButton.icon - 带图标的按钮',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 按钮行2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 带图标的悬浮按钮
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('带图标'),
              ),

              // 带图标的文本按钮
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                label: const Text('喜欢'),
              ),

              // 带图标的描边按钮
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share),
                label: const Text('分享'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 图标按钮控件说明
          const Text(
            '控件: IconButton - 图标按钮',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 图标按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite),
                color: Colors.red,
                iconSize: 32,
                onPressed: () {},
                tooltip: '收藏',
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.blue,
                iconSize: 32,
                onPressed: () {},
                tooltip: '分享',
              ),
              IconButton(
                icon: const Icon(Icons.download),
                color: Colors.green,
                iconSize: 32,
                onPressed: () {},
                tooltip: '下载',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 浮动操作按钮控件说明
          const Text(
            '控件: FloatingActionButton - 浮动操作按钮',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 浮动操作按钮（模拟）
          Container(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: '添加',
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

// 4. 滑块和范围选择器示例
class _SliderExamples extends StatefulWidget {
  const _SliderExamples();

  @override
  State<_SliderExamples> createState() => _SliderExamplesState();
}

class _SliderExamplesState extends State<_SliderExamples> {
  // 单滑块值
  double _sliderValue = 50.0;

  // 范围滑块值
  RangeValues _rangeValues = const RangeValues(20.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          // 滑块控件说明
          const Text(
            '控件: Slider - 基础滑块控件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 基础滑块
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('基础滑块：'),
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
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 带刻度的滑块控件说明
          const Text(
            '控件: Slider (带divisions和label) - 带刻度的滑块',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 带刻度的滑块
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('带刻度的滑块：'),
                  Text(
                    _sliderValue.toStringAsFixed(0),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                divisions: 10,
                label: _sliderValue.toStringAsFixed(0),
                activeColor: Colors.purple,
                inactiveColor: Colors.purple[200],
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 范围滑块控件说明
          const Text(
            '控件: RangeSlider - 范围滑块控件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 范围滑块
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('范围滑块：'),
                  Text(
                    '${_rangeValues.start.toStringAsFixed(0)} - ${_rangeValues.end.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              RangeSlider(
                values: _rangeValues,
                min: 0.0,
                max: 100.0,
                divisions: 10,
                labels: RangeLabels(
                  _rangeValues.start.toStringAsFixed(0),
                  _rangeValues.end.toStringAsFixed(0),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _rangeValues = values;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 5. 日期和时间选择器示例
class _DateTimePickerExamples extends StatelessWidget {
  const _DateTimePickerExamples();

  // 显示日期选择器
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('选择的日期: ${picked.toLocal()}')),
      );
    }
  }

  // 显示时间选择器
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('选择的时间: ${picked.format(context)}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        children: [
          // 日期时间选择器控件说明
          const Text(
            '控件: showDatePicker, showTimePicker - 日期时间选择器',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 日期选择器按钮
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('选择日期'),
          ),
          const SizedBox(height: 16),

          // 时间选择器按钮
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text('选择时间'),
          ),
          const SizedBox(height: 16),

          // 日期时间选择器说明
          Text(
            '点击按钮可以打开日期或时间选择器，\n这些是Flutter内置的对话框组件。',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

// 6. 触摸手势控件示例
class _GestureExamples extends StatefulWidget {
  const _GestureExamples();

  @override
  State<_GestureExamples> createState() => _GestureExamplesState();
}

class _GestureExamplesState extends State<_GestureExamples> {
  int _tapCount = 0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          // 点击手势
          GestureDetector(
            onTap: () {
              setState(() {
                _tapCount++;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.teal,
              alignment: Alignment.center,
              child: Text(
                '$_tapCount',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('点击上面的方块计数'),
          const SizedBox(height: 16),

          // 双击手势
          GestureDetector(
            onDoubleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('双击了方块')),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.teal[300],
              alignment: Alignment.center,
              child: const Text(
                '双击我',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('双击上面的方块'),
          const SizedBox(height: 16),

          // 长按手势
          GestureDetector(
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('长按了方块')),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.teal[500],
              alignment: Alignment.center,
              child: const Text(
                '长按我',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('长按上面的方块'),
          const SizedBox(height: 16),

          // 缩放手势
          GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _scale = details.scale;
              });
            },
            child: Transform.scale(
              scale: _scale,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal[700],
                alignment: Alignment.center,
                child: const Text(
                  '缩放我',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('捏合上面的方块进行缩放'),
          const SizedBox(height: 16),

          // InkWell 示例
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击了InkWell')),
              );
            },
            onHover: (bool hovered) {
              // 鼠标悬停效果
            },
            onFocusChange: (bool focused) {
              // 焦点变化效果
            },
            child: Container(
              width: 200,
              height: 50,
              color: Colors.teal[900],
              alignment: Alignment.center,
              child: const Text(
                'InkWell 点击效果',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('InkWell 提供了点击涟漪效果'),
        ],
      ),
    );
  }
}
