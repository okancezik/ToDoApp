import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/models/to_do_model.dart';
import 'package:uuid/uuid.dart';

class ToDoListNotifier extends StateNotifier<List<ToDoModel>> {
  ToDoListNotifier([List<ToDoModel>? initialToDos]) : super(initialToDos ?? []);

  void addToDo(String description) {
    var newToDo = ToDoModel(id: const Uuid().v4(), description: description);
    state = [...state, newToDo];
  }

  void toogle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          ToDoModel(
              id: todo.id,
              description: todo.description,
              isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          ToDoModel(
              id: todo.id,
              description: newDescription,
              isCompleted: todo.isCompleted)
        else
          todo
    ];
  }

  void remove(ToDoModel todoModel) {
    state = [
      for (var todo in state)
        if (todo.id != todoModel.id) todo
    ];

    //different solve
    //state = state.where((element) => element.id != todoModel.id).toList();
  }

  int unCompletedToDoCount() {
    return state.where((element) => element.isCompleted != true).length;
  }
}
