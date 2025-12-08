
// Flutter动画效果演示
import 'package:flutter/material.dart';

// 动画演示主页面
class AnimationDemo extends StatelessWidget {
  const AnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画效果演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter动画示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 隐式动画示例
            _buildSectionTitle('1. 隐式动画（AnimatedContainer）'),
            const ImplicitAnimationExample(),
            const SizedBox(height: 20),

            // 2. 淡入淡出动画
            _buildSectionTitle('2. 淡入淡出动画（FadeTransition）'),
            const FadeAnimationExample(),
            const SizedBox(height: 20),

            // 3. 缩放动画
            _buildSectionTitle('3. 缩放动画（ScaleTransition）'),
            const ScaleAnimationExample(),
            const SizedBox(height: 20),

            // 4. 旋转动画
            _buildSectionTitle('4. 旋转动画（RotationTransition）'),
            const RotationAnimationExample(),
            const SizedBox(height: 20),

            // 5. 平移动画
            _buildSectionTitle('5. 平移动画（SlideTransition）'),
            const SlideAnimationExample(),
            const SizedBox(height: 20),

            // 6. 组合动画
            _buildSectionTitle('6. 组合动画'),
            const CombinedAnimationExample(),
            const SizedBox(height: 20),

            // 7. 英雄动画
            _buildSectionTitle('7. 英雄动画（Hero）'),
            const HeroAnimationExample(),
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

// 1. 隐式动画示例
class ImplicitAnimationExample extends StatefulWidget {
  const ImplicitAnimationExample({super.key});

  @override
  State<ImplicitAnimationExample> createState() => _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  // 控制容器大小
  bool _isExpanded = false;

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
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(_isExpanded ? '收缩' : '展开'),
          ),
          const SizedBox(height: 16),
          // AnimatedContainer是隐式动画组件
          // 当属性变化时，会自动生成过渡动画
          AnimatedContainer(
            // 动画持续时间
            duration: const Duration(seconds: 1),
            // 动画曲线
            curve: Curves.easeInOut,
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(_isExpanded ? 50 : 20),
            ),
            alignment: Alignment.center,
            child: const Text(
              'AnimatedContainer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. 淡入淡出动画
class FadeAnimationExample extends StatefulWidget {
  const FadeAnimationExample({super.key});

  @override
  State<FadeAnimationExample> createState() => _FadeAnimationExampleState();
}

class _FadeAnimationExampleState extends State<FadeAnimationExample>
    with SingleTickerProviderStateMixin {
  // 动画控制器
  late AnimationController _controller;
  // 动画值
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    // 创建动画控制器
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // 使用SingleTickerProviderStateMixin
    );
    
    // 创建淡入淡出动画
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // 释放动画控制器资源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.forward(); // 播放动画
                },
                child: const Text('淡入'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reverse(); // 反向播放动画
                },
                child: const Text('淡出'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // FadeTransition用于淡入淡出动画
          FadeTransition(
            opacity: _opacity,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                'Fade Transition',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. 缩放动画
class ScaleAnimationExample extends StatefulWidget {
  const ScaleAnimationExample({super.key});

  @override
  State<ScaleAnimationExample> createState() => _ScaleAnimationExampleState();
}

class _ScaleAnimationExampleState extends State<ScaleAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    
    // 创建缩放动画
    _scale = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
    
    // 设置动画重复
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          const Text('自动重复缩放动画'),
          const SizedBox(height: 16),
          // ScaleTransition用于缩放动画
          ScaleTransition(
            scale: _scale,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.orange,
              alignment: Alignment.center,
              child: const Text(
                'Scale Transition',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 4. 旋转动画
class RotationAnimationExample extends StatefulWidget {
  const RotationAnimationExample({super.key});

  @override
  State<RotationAnimationExample> createState() => _RotationAnimationExampleState();
}

class _RotationAnimationExampleState extends State<RotationAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    // 创建旋转动画，从0到2π（360度）
    _rotation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.forward(); // 正向旋转
                },
                child: const Text('开始旋转'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.stop(); // 停止旋转
                },
                child: const Text('停止'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reset(); // 重置
                },
                child: const Text('重置'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // RotationTransition用于旋转动画
          RotationTransition(
            turns: _rotation,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.purple,
              alignment: Alignment.center,
              child: const Text(
                'Rotation Transition',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. 平移动画
class SlideAnimationExample extends StatefulWidget {
  const SlideAnimationExample({super.key});

  @override
  State<SlideAnimationExample> createState() => _SlideAnimationExampleState();
}

class _SlideAnimationExampleState extends State<SlideAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // 创建平移动画
    _offset = Tween<Offset>(
      begin: const Offset(-1, 0), // 从左侧进入
      end: const Offset(1, 0), // 到右侧退出
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          ElevatedButton(
            onPressed: () {
              // 重置并播放动画
              _controller.reset();
              _controller.forward();
            },
            child: const Text('开始平移动画'),
          ),
          const SizedBox(height: 50),
          // SlideTransition用于平移动画
          SlideTransition(
            position: _offset,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'Slide Transition',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 6. 组合动画
class CombinedAnimationExample extends StatefulWidget {
  const CombinedAnimationExample({super.key});

  @override
  State<CombinedAnimationExample> createState() => _CombinedAnimationExampleState();
}

class _CombinedAnimationExampleState extends State<CombinedAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // 创建多种动画
    _scale = Tween<double>(begin: 1.0, end: 1.3).animate(_controller);
    _opacity = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    _rotation = Tween<double>(begin: 0, end: 0.5 * 3.14159).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.forward(); // 播放动画
                },
                child: const Text('开始动画'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reverse(); // 反向播放
                },
                child: const Text('反向播放'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // 组合多种动画
          FadeTransition(
            opacity: _opacity,
            child: ScaleTransition(
              scale: _scale,
              child: RotationTransition(
                turns: _rotation,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.teal,
                  alignment: Alignment.center,
                  child: const Text(
                    'Combined Animations',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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

// 7. 英雄动画
class HeroAnimationExample extends StatelessWidget {
  const HeroAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo, width: 1),
      ),
      child: Column(
        children: [
          const Text('点击卡片查看英雄动画效果'),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // 导航到详情页，展示英雄动画
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HeroDetailPage()),
              );
            },
            child: const Hero(
              // Hero的tag必须唯一，且在两个页面中相同
              tag: 'hero-tag',
              child: Card(
                elevation: 4,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text('Hero Card'),
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

// 英雄动画详情页
class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('英雄动画详情'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // 返回上一页
            Navigator.pop(context);
          },
          child: const Hero(
            // 相同的tag，用于关联两个Hero组件
            tag: 'hero-tag',
            child: Card(
              elevation: 8,
              child: SizedBox(
                width: 300,
                height: 300,
                child: Center(
                  child: Text(
                    'Hero Card Detail',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
