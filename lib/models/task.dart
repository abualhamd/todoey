import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String taskId;
  final String title;
  bool state;

  Task({required this.title})
      : state = false,
        taskId = Uuid().v1();

  void updateState() {
    state = !state;
  }

  @override
  List<Object?> get props => [taskId];
}
