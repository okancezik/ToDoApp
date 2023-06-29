import 'package:flutter/material.dart';
import 'package:to_do_app/product/models/to_do_model.dart';

class ToDoListItemWidget extends StatelessWidget {

  final ToDoModel toDoModel;
  const ToDoListItemWidget({super.key, required this.toDoModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: toDoModel.isCompleted, onChanged: (value) {
        print(value.toString());
      },),
      title: Text(toDoModel.description),
    );
  }
}