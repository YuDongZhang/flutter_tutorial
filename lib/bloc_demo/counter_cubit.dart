import 'package:flutter_bloc/flutter_bloc.dart';

/// CounterCubit: 最简单的状态管理
/// Cubit 是 Bloc 的简化版，没有 Event 的概念，直接通过函数调用改变状态
/// 泛型 <int> 指定了状态的类型为 int (Count值)
class CounterCubit extends Cubit<int> {
  // 构造函数，super(0) 指定了初始状态为 0
  CounterCubit() : super(0);

  // 增加计数
  void increment() {
    // emit 用于发送新状态
    // state 获取当前状态
    emit(state + 1);
  }

  // 减少计数
  void decrement() => emit(state - 1);
}
