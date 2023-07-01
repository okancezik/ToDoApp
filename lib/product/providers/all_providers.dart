
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
