import 'package:rest_apis_riverpod/core/models/task.dart';
import 'package:rest_apis_riverpod/features/tasks/models/write_task_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'write_task_notifier_provider.g.dart';

@riverpod
class WriteTaskNotifier extends _$WriteTaskNotifier {
  @override
  WriteTaskState build(Task? task) {
    return WriteTaskState(
      task: task ?? Task.empty(),
      loading: false,
    );
  }

  void nameChanged(String name) {
    state = state.copyWith(
        // task: state.task.copyWith(name: name),
        );
  }
}
