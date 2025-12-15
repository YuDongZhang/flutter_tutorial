import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// ============================================================================
// 1. Events (事件)
// ============================================================================

// 使用 Equatable 可以方便地进行对象比较 (props 列表中的属性相等则对象相等)
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

/// 触发加载用户数据的事件
class LoadUser extends UserEvent {}

/// 更新用户姓名的事件
class UpdateUserName extends UserEvent {
  final String newName;

  const UpdateUserName(this.newName);

  @override
  List<Object> get props => [newName];
}

// ============================================================================
// 2. States (状态)
// ============================================================================

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

/// 初始状态
class UserInitial extends UserState {}

/// 加载中状态
class UserLoading extends UserState {}

/// 加载成功状态 (携带数据)
class UserLoaded extends UserState {
  final String name;
  final int age;

  const UserLoaded({required this.name, required this.age});

  @override
  List<Object> get props => [name, age];
  
  // 这是一个辅助方法，用于快速生成新状态（类似 copyWith）
  UserLoaded copyWith({String? name, int? age}) {
    return UserLoaded(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

/// 错误状态
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

// ============================================================================
// 3. BLoC (业务逻辑组件)
// ============================================================================

/// UserBloc 处理 UserEvent 转换为 UserState
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    // 注册事件处理函数
    // 当收到 LoadUser 事件时，执行 _onLoadUser
    on<LoadUser>(_onLoadUser);
    // 当收到 UpdateUserName 事件时，执行 _onUpdateUserName
    on<UpdateUserName>(_onUpdateUserName);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    // 1. 发送加载中状态
    emit(UserLoading());

    try {
      // 2. 模拟网络请求
      await Future.delayed(const Duration(seconds: 2));
      
      // 3. 模拟成功返回数据
      emit(const UserLoaded(name: "Flutter Developer", age: 30));
    } catch (e) {
      // 4. 处理错误
      emit(const UserError("Failed to load user data"));
    }
  }

  Future<void> _onUpdateUserName(UpdateUserName event, Emitter<UserState> emit) async {
    // 获取当前状态，检查是否已经是 UserLoaded 状态
    final currentState = state;
    if (currentState is UserLoaded) {
      // 发送新状态（只修改名字）
      emit(currentState.copyWith(name: event.newName));
    }
  }
}
