import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rest_apis_riverpod/core/models/task.dart';
import 'package:rest_apis_riverpod/core/providers/dio_provider.dart';

final tasksRepositoryProvider = Provider(TasksRepository.new);

class TasksRepository {
  final Ref ref;

  TasksRepository(this.ref);

  Dio get _dio => ref.read(dioProvider);

  Future<List<Task>> list() async {
    try {
      final res = await _dio.get('/tasks');

      final Iterable data = res.data;

      return data.map((e) => Task.fromMap(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw Future.error(e.response?.data['message'] ?? e.message);
    }
  }

  Future<void> create(Task task) async {
    try {
      await _dio.post(
        '/tasks',
        data: task.toMap(),
      );
    } on DioException catch (e) {
      throw Future.error(e.response?.data['message'] ?? e.message);
    }
  }

  Future<void> edit(Task task) async {
    try {
      await _dio.put(
        '/tasks/${task.id}',
        data: task.toMap(),
      );
    } on DioException catch (e) {
      throw Future.error(e.response?.data['message'] ?? e.message);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('/tasks/$id');
    } on DioException catch (e) {
      throw Future.error(e.response?.data['message'] ?? e.message);
    }
  }
}
