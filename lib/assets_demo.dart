// Flutter 资源、图片和图标示例
import 'package:flutter/material.dart';

// 资源示例页面
class AssetsDemo extends StatelessWidget {
  const AssetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('资源、图片和图标示例'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '资源、图片和图标示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. 图标示例
            _buildSectionTitle('1. 内置图标 (Icons)'),
            _buildIconsExample(),
            const SizedBox(height: 20),

            // 2. 网络图片示例
            _buildSectionTitle('2. 网络图片 (NetworkImage)'),
            _buildNetworkImageExample(),
            const SizedBox(height: 20),

            // 3. 本地资源图片示例
            _buildSectionTitle('3. 本地资源图片'),
            _buildAssetImageExample(),
            const SizedBox(height: 20),

            // 4. 图片占位符示例
            _buildSectionTitle('4. 图片占位符和错误处理'),
            _buildImageWithPlaceholderExample(),
            const SizedBox(height: 20),

            // 5. 图片缓存示例
            _buildSectionTitle('5. 图片缓存和尺寸控制'),
            _buildImageCacheExample(),
            const SizedBox(height: 20),

            // 6. SVG 图标示例
            _buildSectionTitle('6. 图标按钮和自定义图标'),
            _buildIconButtonExample(),
            const SizedBox(height: 20),

            // 7. 资源加载示例
            _buildSectionTitle('7. 资源加载和管理'),
            _buildAssetLoadingExample(),
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

  // 1. 内置图标示例
  Widget _buildIconsExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          const Text('Flutter 内置了丰富的 Material 图标：'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem(Icons.home, 'home'),
              _buildIconItem(Icons.search, 'search'),
              _buildIconItem(Icons.person, 'person'),
              _buildIconItem(Icons.settings, 'settings'),
              _buildIconItem(Icons.email, 'email'),
              _buildIconItem(Icons.phone, 'phone'),
              _buildIconItem(Icons.camera, 'camera'),
              _buildIconItem(Icons.photo, 'photo'),
              _buildIconItem(Icons.music_note, 'music'),
              _buildIconItem(Icons.video_call, 'video'),
              _buildIconItem(Icons.map, 'map'),
              _buildIconItem(Icons.location_on, 'location'),
            ],
          ),
        ],
      ),
    );
  }

  // 构建图标项
  Widget _buildIconItem(IconData icon, String name) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // 2. 网络图片示例
  Widget _buildNetworkImageExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        children: [
          const Text('从网络加载图片：'),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Image.network(
              'https://picsum.photos/id/237/400/200',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          const Text('使用 Image.network 加载网络图片，支持占位符和错误处理'),
        ],
      ),
    );
  }

  // 3. 本地资源图片示例
  Widget _buildAssetImageExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          const Text('从本地资源加载图片：'),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.orange[300],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '本地资源图片示例',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '要使用本地资源图片，需要：\n'
                    '1. 在 pubspec.yaml 中配置资源路径\n'
                    '2. 使用 Image.asset() 加载\n'
                    '3. 资源会被打包到应用中',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('使用 Image.asset 加载本地资源图片，需要在 pubspec.yaml 中配置'),
        ],
      ),
    );
  }

  // 4. 图片占位符示例
  Widget _buildImageWithPlaceholderExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Column(
        children: [
          const Text('图片占位符和错误处理：'),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 占位符
                const CircularProgressIndicator(),
                // 网络图片，带有错误处理
                Image.network(
                  'https://picsum.photos/id/238/400/200',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text('使用 Stack 和 errorBuilder 实现图片占位符和错误处理'),
        ],
      ),
    );
  }

  // 5. 图片缓存示例
  Widget _buildImageCacheExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        children: [
          const Text('图片缓存和尺寸控制：'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/id/239/200/100',
                      width: 150,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 8),
                    const Text('BoxFit.fill'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/id/240/200/100',
                      width: 150,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    const Text('BoxFit.contain'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/id/241/200/100',
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    const Text('BoxFit.cover'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Flutter 会自动缓存网络图片，提高加载速度'),
        ],
      ),
    );
  }

  // 6. 图标按钮示例
  Widget _buildIconButtonExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          const Text('图标按钮和自定义图标：'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.grey,
                iconSize: 32,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('使用 IconButton 创建可交互的图标按钮'),
        ],
      ),
    );
  }

  // 7. 资源加载示例
  Widget _buildAssetLoadingExample() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo, width: 2),
      ),
      child: Column(
        children: [
          const Text('资源加载和管理：'),
          const SizedBox(height: 16),
          const Text('在 Flutter 中管理资源需要注意：'),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. 在 pubspec.yaml 中配置资源路径'),
                Text('2. 使用 rootBundle 加载文本和二进制资源'),
                Text('3. 使用 AssetImage 加载图片资源'),
                Text('4. 资源会被打包到应用中，影响应用大小'),
                Text('5. 支持不同分辨率的资源变体'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // 示例：使用 rootBundle 加载文本资源
              // final content = await rootBundle.loadString('assets/text.txt');
              // print(content);
            },
            child: const Text('加载文本资源示例'),
          ),
        ],
      ),
    );
  }
}
