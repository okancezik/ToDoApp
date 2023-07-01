import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int unCompletedToDoCount = ref
        .watch(todoProvider)
        .where(
          (element) => element.isCompleted == false,
        )
        .length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(
          unCompletedToDoCount != 0 ?
          "$unCompletedToDoCount uncompleted todos" : "There is not todo", 
          overflow: TextOverflow.ellipsis,)),
        Tooltip(
          message: "All Todos",
          child: TextButton(onPressed: () {}, child: const Text("All")),
        ),
        Tooltip(
          message: "Only Uncompleted Todos",
          child: TextButton(onPressed: () {}, child: const Text("Active")),
        ),
        Tooltip(
          message: "Only Completed Todos",
          child: TextButton(onPressed: () {}, child: const Text("Complete")),
        ),
      ],
    );
  }
}
