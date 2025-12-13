// Flutter 交互模型部件示例
import 'package:flutter/material.dart';

// 交互模型部件示例页面
class InteractionDemo extends StatelessWidget {
  const InteractionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交互模型部件示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '交互模型部件示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 拖拽部件
            _buildSectionTitle('1. 拖拽部件'),
            const _DraggableExample(),
            const SizedBox(height: 20),

            // 2. 滑动删除部件
            _buildSectionTitle('2. 滑动删除部件'),
            const _DismissibleExample(),
            const SizedBox(height: 20),

            // 3. 可重排序列表
            _buildSectionTitle('3. 可重排序列表'),
            const _ReorderableListViewExample(),
            const SizedBox(height: 20),

            // 4. 动画切换部件
            _buildSectionTitle('4. 动画切换部件'),
            const _AnimatedSwitcherExample(),
            const SizedBox(height: 20),

            // 5. 焦点管理部件
            _buildSectionTitle('5. 焦点管理部件'),
            const _FocusNodeExample(),
            const SizedBox(height: 20),

            // 6. 鼠标区域部件
            _buildSectionTitle('6. 鼠标区域部件'),
            const _MouseRegionExample(),
            const SizedBox(height: 20),

            // 7. 通知监听器部件
            _buildSectionTitle('7. 通知监听器部件'),
            const _NotificationListenerExample(),
            const SizedBox(height: 20),

            // 8. 手势检测器高级示例
            _buildSectionTitle('8. 手势检测器高级示例'),
            const _AdvancedGestureDetectorExample(),
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

// 1. 拖拽部件示例
class _DraggableExample extends StatefulWidget {
  const _DraggableExample();

  @override
  State<_DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<_DraggableExample> {
  final Color _draggableColor = Colors.blue;
  Color _targetColor = Colors.grey[200]!;

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
          const Text('拖拽部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: Draggable + DragTarget - 拖拽交互组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 可拖拽部件
              Draggable<Color>(
                // 拖拽数据
                data: _draggableColor,
                // 拖拽时的反馈
                feedback: Container(
                  width: 80,
                  height: 80,
                  color: const Color.fromARGB(204, 0, 0, 255),
                  alignment: Alignment.center,
                  child: const Icon(Icons.drag_indicator, color: Colors.white),
                ),
                // 拖拽时原部件的显示
                childWhenDragging: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.drag_indicator, color: Colors.white),
                ),
                // 原始部件
                child: Container(
                  width: 80,
                  height: 80,
                  color: _draggableColor,
                  alignment: Alignment.center,
                  child: const Icon(Icons.drag_indicator, color: Colors.white),
                ),
              ),

              // 拖拽目标
              DragTarget<Color>(
                // 当拖拽部件在目标区域释放
                onAcceptWithDetails: (details) {
                  setState(() {
                    _targetColor = details.data;
                  });
                },
                // 拖拽目标的外观
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: _targetColor,
                    alignment: Alignment.center,
                    child: const Icon(Icons.water_drop, color: Colors.white),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '拖拽左侧的色块到右侧的目标区域',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 2. 滑动删除部件示例
class _DismissibleExample extends StatefulWidget {
  const _DismissibleExample();

  @override
  State<_DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<_DismissibleExample> {
  final List<String> _items = List.generate(10, (index) => '项目 ${index + 1}');

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
          const Text('滑动删除部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: Dismissible - 滑动删除组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Dismissible(
                  // 每个Dismissible都需要一个唯一的key
                  key: Key(item),
                  // 滑动方向
                  direction: DismissDirection.endToStart,
                  // 背景颜色和图标
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  // 确认删除对话框
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('确认删除'),
                          content: Text('确定要删除 "$item" 吗？'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('取消'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('删除'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // 当部件被删除时调用
                  onDismissed: (direction) {
                    setState(() {
                      _items.removeAt(index);
                    });
                    // 显示删除提示
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('删除了 "$item"')),
                    );
                  },
                  // 部件内容
                  child: ListTile(
                    title: Text(item),
                    leading: const Icon(Icons.list),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '滑动列表项从右到左可以删除项目',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 3. 可重排序列表示例
class _ReorderableListViewExample extends StatefulWidget {
  const _ReorderableListViewExample();

  @override
  State<_ReorderableListViewExample> createState() =>
      _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState
    extends State<_ReorderableListViewExample> {
  final List<String> _items =
      List.generate(5, (index) => '可重排序列表项 ${index + 1}');

  // 处理列表项重排
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

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
          const Text('可重排序列表示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: ReorderableListView - 可重排序列表',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ReorderableListView(
              // 重排回调
              onReorder: _onReorder,
              // 列表项
              children: _items
                  .map((item) => ListTile(
                        key: Key(item),
                        title: Text(item),
                        leading: const Icon(Icons.drag_handle),
                        tileColor: Colors.orange[50],
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '长按并拖拽列表项可以重新排序',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 4. 动画切换部件示例
class _AnimatedSwitcherExample extends StatefulWidget {
  const _AnimatedSwitcherExample();

  @override
  State<_AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<_AnimatedSwitcherExample> {
  bool _isFirstWidget = true;

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
          const Text('动画切换部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: AnimatedSwitcher - 动画切换组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          // 动画切换容器
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              // 可以使用不同的过渡效果
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            // 切换时的对齐方式
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            // 根据状态显示不同的部件
            child: _isFirstWidget
                ? Container(
                    key: const ValueKey(1),
                    width: 200,
                    height: 200,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child:
                        const Icon(Icons.star, color: Colors.white, size: 100),
                  )
                : Container(
                    key: const ValueKey(2),
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Icon(Icons.favorite,
                        color: Colors.white, size: 100),
                  ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFirstWidget = !_isFirstWidget;
              });
            },
            child: const Text('切换部件'),
          ),
          const SizedBox(height: 16),
          Text(
            '点击按钮可以看到部件之间的平滑过渡动画',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 5. 焦点管理部件示例
class _FocusNodeExample extends StatefulWidget {
  const _FocusNodeExample();

  @override
  State<_FocusNodeExample> createState() => _FocusNodeExampleState();
}

class _FocusNodeExampleState extends State<_FocusNodeExample> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    // 监听焦点变化
    _focusNode1.addListener(() {
      setState(() {
        _isFocused = _focusNode1.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // 释放焦点节点
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
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
          const Text('焦点管理部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: FocusNode + FocusScope - 焦点管理组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          TextField(
            focusNode: _focusNode1,
            decoration: InputDecoration(
              labelText: '输入框1',
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            focusNode: _focusNode2,
            decoration: const InputDecoration(
              labelText: '输入框2',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            focusNode: _focusNode3,
            decoration: const InputDecoration(
              labelText: '输入框3',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 设置焦点到输入框1
                  FocusScope.of(context).requestFocus(_focusNode1);
                },
                child: const Text('聚焦输入框1'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 移除所有焦点
                  FocusScope.of(context).unfocus();
                },
                child: const Text('移除焦点'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '焦点状态: ${_isFocused ? '已聚焦' : '未聚焦'}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isFocused ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// 6. 鼠标区域部件示例
class _MouseRegionExample extends StatefulWidget {
  const _MouseRegionExample();

  @override
  State<_MouseRegionExample> createState() => _MouseRegionExampleState();
}

class _MouseRegionExampleState extends State<_MouseRegionExample> {
  bool _isHovered = false;
  MouseCursor _cursor = SystemMouseCursors.basic;

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
          const Text('鼠标区域部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: MouseRegion - 鼠标交互组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          MouseRegion(
            // 鼠标进入区域
            onEnter: (event) {
              setState(() {
                _isHovered = true;
                _cursor = SystemMouseCursors.click;
              });
            },
            // 鼠标离开区域
            onExit: (event) {
              setState(() {
                _isHovered = false;
                _cursor = SystemMouseCursors.basic;
              });
            },

            // 设置鼠标指针
            cursor: _cursor,
            // 子部件
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 200,
              height: 200,
              color: _isHovered ? Colors.teal[500] : Colors.teal[300],
              transform: _isHovered
                  ? Matrix4.diagonal3Values(1.1, 1.1, 1.0)
                  : Matrix4.identity(),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mouse, color: Colors.white, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    _isHovered ? '鼠标悬停中' : '鼠标未悬停',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '将鼠标移动到上方区域查看效果',
            style: TextStyle(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 7. 通知监听器部件示例
class _NotificationListenerExample extends StatefulWidget {
  const _NotificationListenerExample();

  @override
  State<_NotificationListenerExample> createState() =>
      _NotificationListenerExampleState();
}

class _NotificationListenerExampleState
    extends State<_NotificationListenerExample> {
  String _scrollInfo = '';
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo, width: 2),
      ),
      child: Column(
        children: [
          const Text('通知监听器部件示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: NotificationListener - 通知监听组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          // 滚动位置信息
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('滚动信息: $_scrollInfo'),
                Text('滚动偏移量: ${_scrollOffset.toStringAsFixed(2)}'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 通知监听器
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              setState(() {
                // 根据通知类型更新状态
                if (notification is ScrollStartNotification) {
                  _scrollInfo = '开始滚动';
                } else if (notification is ScrollUpdateNotification) {
                  _scrollInfo = '滚动中';
                  _scrollOffset = notification.metrics.pixels;
                } else if (notification is ScrollEndNotification) {
                  _scrollInfo = '滚动结束';
                } else if (notification is OverscrollNotification) {
                  _scrollInfo = '滚动超出范围';
                }
              });
              // 返回false表示通知会继续传递，返回true表示通知已处理
              return false;
            },
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('列表项 $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 8. 手势检测器高级示例
class _AdvancedGestureDetectorExample extends StatefulWidget {
  const _AdvancedGestureDetectorExample();

  @override
  State<_AdvancedGestureDetectorExample> createState() =>
      _AdvancedGestureDetectorExampleState();
}

class _AdvancedGestureDetectorExampleState
    extends State<_AdvancedGestureDetectorExample> {
  String _gestureInfo = '等待手势...';
  double _rotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: Column(
        children: [
          const Text('手势检测器高级示例：'),
          const SizedBox(height: 8),
          const Text(
            '控件: GestureDetector - 手势检测组件',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            _gestureInfo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            // 点击手势
            onTap: () {
              setState(() {
                _gestureInfo = '点击';
              });
            },
            // 双击手势
            onDoubleTap: () {
              setState(() {
                _gestureInfo = '双击';
              });
            },
            // 长按手势
            onLongPress: () {
              setState(() {
                _gestureInfo = '长按';
              });
            },
            // 只使用ScaleUpdate来处理所有手势
            onScaleStart: (details) {
              setState(() {
                _gestureInfo = '开始手势操作';
              });
            },
            onScaleUpdate: (details) {
              setState(() {
                _rotation = details.rotation;
                // 检测是拖动还是缩放/旋转
                if (details.scale != 1.0 || details.rotation != 0.0) {
                  // 缩放或旋转
                  _gestureInfo =
                      '缩放/旋转中: 缩放=${details.scale.toStringAsFixed(2)}, 旋转=${details.rotation.toStringAsFixed(2)}';
                } else {
                  // 拖动
                  _gestureInfo =
                      '拖动中: dx=${details.focalPointDelta.dx.toStringAsFixed(2)}, dy=${details.focalPointDelta.dy.toStringAsFixed(2)}';
                }
              });
            },
            onScaleEnd: (details) {
              setState(() {
                _gestureInfo = '结束手势操作';
              });
            },
            // 子部件
            child: Transform.rotate(
              angle: _rotation,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                alignment: Alignment.center,
                child: const Text(
                  '手势检测区域\n\n点击、双击、长按\n拖动、缩放/旋转',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
