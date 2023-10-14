import 'package:rest_apis_riverpod/core/models/task.dart';
import 'package:rest_apis_riverpod/core/repositories/task_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_provider.g.dart';

@riverpod
FutureOr<List<Task>> tasks(TasksRef ref) {
  return ref.read(tasksRepositoryProvider).list();
}
