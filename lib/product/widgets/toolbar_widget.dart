import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int unCompletedToDoCount = ref.watch(unCompletedTodoCount);
    var _currentFilter = ToDoListFilter.all;

    _currentFilter = ref.watch(todoListFilterProvider);

    Color changeTextColor(ToDoListFilter filter) {
      return _currentFilter == filter ? Colors.orange : Colors.black;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          unCompletedToDoCount != 0
              ? "$unCompletedToDoCount uncompleted todos"
              : "There is not todo",
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: "All Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: changeTextColor(ToDoListFilter.all)),
              onPressed: () {
                ref.read(todoListFilterProvider.notifier).state =
                    ToDoListFilter.all;
              },
              child: const Text("All")),
        ),
        Tooltip(
          message: "Only Uncompleted Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: changeTextColor(ToDoListFilter.active)),
              onPressed: () {
                ref.read(todoListFilterProvider.notifier).state =
                    ToDoListFilter.active;
              },
              child: const Text("Active")),
        ),
        Tooltip(
          message: "Only Completed Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: changeTextColor(ToDoListFilter.completed)),
              onPressed: () {
                ref.read(todoListFilterProvider.notifier).state =
                    ToDoListFilter.completed;
              },
              child: const Text("Complete")),
        ),
      ],
    );
  }
}
