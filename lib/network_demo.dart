
// Flutter网络请求演示
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 网络请求演示页面
class NetworkDemo extends StatelessWidget {
  const NetworkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求演示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter网络请求示例',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. GET请求示例
            _buildSectionTitle('1. GET请求示例'),
            const GetRequestExample(),
            const SizedBox(height: 20),

            // 2. POST请求示例
            _buildSectionTitle('2. POST请求示例'),
            const PostRequestExample(),
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

// GET请求示例
class GetRequestExample extends StatefulWidget {
  const GetRequestExample({super.key});

  @override
  State<GetRequestExample> createState() => _GetRequestExampleState();
}

class _GetRequestExampleState extends State<GetRequestExample> {
  // 请求状态
  bool _isLoading = false;
  // 请求结果
  String _result = '';
  // 错误信息
  String _error = '';

  // 发起GET请求
  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _result = '';
      _error = '';
    });

    try {
      // 发起GET请求到JSONPlaceholder API
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      // 检查响应状态码
      if (response.statusCode == 200) {
        // 解析JSON数据
        final data = json.decode(response.body);
        setState(() {
          _result = 'GET请求成功!\n\n数据: ${json.encode(data)}';
        });
      } else {
        setState(() {
          _error = 'GET请求失败，状态码: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _error = '请求出错: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('获取示例数据'),
              ElevatedButton(
                onPressed: _isLoading ? null : _fetchData,
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('发起请求'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // 显示结果或错误
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error.isNotEmpty
                  ? Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    )
                  : _result.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(_result),
                          ),
                        )
                      : const SizedBox()
        ],
      ),
    );
  }
}

// POST请求示例
class PostRequestExample extends StatefulWidget {
  const PostRequestExample({super.key});

  @override
  State<PostRequestExample> createState() => _PostRequestExampleState();
}

class _PostRequestExampleState extends State<PostRequestExample> {
  // 请求状态
  bool _isLoading = false;
  // 请求结果
  String _result = '';
  // 错误信息
  String _error = '';
  // 表单控制器
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  // 发起POST请求
  Future<void> _sendData() async {
    // 验证表单
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      setState(() {
        _error = '请填写所有字段';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _result = '';
      _error = '';
    });

    try {
      // 准备请求体数据
      final body = {
        'title': _titleController.text,
        'body': _bodyController.text,
        'userId': 1,
      };

      // 发起POST请求
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      // 检查响应状态码
      if (response.statusCode == 201) {
        // 请求成功，解析返回数据
        final data = json.decode(response.body);
        setState(() {
          _result = 'POST请求成功!\n\n返回数据: ${json.encode(data)}';
        });
      } else {
        setState(() {
          _error = 'POST请求失败，状态码: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _error = '请求出错: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // 释放控制器资源
    _titleController.dispose();
    _bodyController.dispose();
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
          const Text('发送POST请求'),
          const SizedBox(height: 10),
          // 标题输入框
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: '标题',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          // 内容输入框
          TextField(
            controller: _bodyController,
            decoration: const InputDecoration(
              labelText: '内容',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          // 发送按钮
          ElevatedButton(
            onPressed: _isLoading ? null : _sendData,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('发送请求'),
          ),
          const SizedBox(height: 10),
          // 显示结果或错误
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error.isNotEmpty
                  ? Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    )
                  : _result.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(_result),
                          ),
                        )
                      : const SizedBox()
        ],
      ),
    );
  }
}
