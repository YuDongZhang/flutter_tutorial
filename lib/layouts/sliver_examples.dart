
// Flutter 官方布局文档示例 - Sliver 滚动效果
import 'package:flutter/material.dart';

// Sliver 滚动效果示例页面
class SliverExamples extends StatelessWidget {
  const SliverExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver 滚动效果示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sliver 滚动效果示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 浮动顶栏示例
            _buildSectionTitle('1. 浮动顶栏', 'Floating Sliver App Bar'),
            _buildFloatingAppBarDemo(),
            const SizedBox(height: 20),

            // 2. 平行错位滚动示例
            _buildSectionTitle('2. 平行错位滚动', 'Parallax Sliver Scroll'),
            _buildParallaxScrollDemo(),
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

  // 1. 浮动顶栏示例
  Widget _buildFloatingAppBarDemo() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          // 浮动顶栏
          SliverAppBar(
            // 是否固定在顶部
            pinned: true,
            // 是否浮动
            floating: true,
            // 展开高度
            expandedHeight: 100,
            // 背景
            backgroundColor: Colors.blue,
            // 标题
            title: const Text('浮动顶栏示例', style: TextStyle(color: Colors.white)),
            // 展开区域
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.blue,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  '向下滚动查看浮动效果',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          
          // 内容
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('SliverList 项 ${index + 1}'),
                  subtitle: Text('这是 SliverList 中的第 ${index + 1} 个元素'),
                  leading: const Icon(Icons.list),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  // 2. 平行错位滚动示例
  Widget _buildParallaxScrollDemo() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          // 大型图片区域
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              expandedHeight: 200.0,
            ),
            // 是否固定
            pinned: true,
          ),
          
          // 内容区域
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '平行滚动内容项 ${index + 1}: 这是平行滚动效果的内容区域，当你向下滚动时，图片会以不同的速度移动，产生视差效果。这种效果常用于详情页的头部图片展示。',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// 平行滚动代理
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  _SliverAppBarDelegate({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 背景图片
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green, Colors.green[300]!],
            ),
          ),
        ),
        // 内容
        Positioned(
          bottom: 16,
          left: 16,
          child: Opacity(
            opacity: 1.0 - shrinkOffset / expandedHeight,
            child: const Text(
              '平行错位滚动效果',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 最小高度
  @override
  double get minExtent => 60.0;

  // 最大高度
  @override
  double get maxExtent => expandedHeight;

  // 是否需要重绘
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
  }
}
