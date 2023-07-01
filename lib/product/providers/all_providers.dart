import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/models/to_do_model.dart';
import 'package:to_do_app/product/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoProvider =
    StateNotifierProvider<ToDoListNotifier, List<ToDoModel>>((ref) {
  return ToDoListNotifier([
    ToDoModel(id: const Uuid().v4(), description: "Spora git"),
    ToDoModel(id: const Uuid().v4(), description: "Alışverişe git")
  ]);
});

//This provider watches other provider
final unCompletedTodoCount = Provider<int>((ref) {
  final allTodo = ref.watch(todoProvider);
  final count = allTodo.where((element) => !element.isCompleted).length;
  return count;
});

enum ToDoListFilter { all, active, completed }

final todoListFilterProvider = StateProvider<ToDoListFilter>((ref) {
  return ToDoListFilter.all;
});

final filteredProvider = Provider<List<ToDoModel>>((ref) {
  final filter = ref.watch(todoListFilterProvider);
  final todoList = ref.watch(todoProvider);

  switch (filter) {
    case ToDoListFilter.all:
      return todoList;
    case ToDoListFilter.active:
      return todoList.where((element) => !element.isCompleted).toList();
    case ToDoListFilter.completed:
      return todoList.where((element) => element.isCompleted).toList();
    default:
      return todoList;
  }
});
