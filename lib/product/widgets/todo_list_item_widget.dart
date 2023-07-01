import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/models/to_do_model.dart';
import 'package:to_do_app/product/providers/all_providers.dart';

class ToDoListItemWidget extends ConsumerWidget {
  final ToDoModel toDoModel;
  const ToDoListItemWidget({super.key, required this.toDoModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: toDoModel.isCompleted,
        onChanged: (value) {
          //print(value.toString());
          ref.read(todoProvider.notifier).toogle(toDoModel.id);
        },
      ),
      title: Text(toDoModel.description),
    );
  }
}
