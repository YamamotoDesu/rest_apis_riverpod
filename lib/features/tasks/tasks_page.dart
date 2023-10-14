import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rest_apis_riverpod/features/tasks/providers/tasks_provider.dart';
import 'package:rest_apis_riverpod/features/tasks/write_task_page.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WriteTaskPage()),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(tasksProvider),
        child: ref.watch(tasksProvider).when(
              data: (tasks) => ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return ListTile(
                    leading: Checkbox(
                      value: task.done,
                      onChanged: (value) {},
                    ),
                    title: Text(task.name),
                    subtitle: Text(task.description),
                  );
                },
              ),
              error: (e, s) => Center(
                child: Text('$e'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
