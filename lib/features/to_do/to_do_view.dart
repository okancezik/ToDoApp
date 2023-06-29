import 'package:flutter/material.dart';
import 'package:to_do_app/product/models/to_do_model.dart';
import 'package:to_do_app/product/widgets/title_widget.dart';
import 'package:to_do_app/product/widgets/todo_list_item_widget.dart';
import 'package:to_do_app/product/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class ToDoApp extends StatelessWidget {
  ToDoApp({super.key});

  final _controller = TextEditingController();

  List<ToDoModel> _allToDos = [
    ToDoModel(id: const Uuid().v4(), description: "Spora git"),
    ToDoModel(id: const Uuid().v4(), description: "Alışveriş yap"),
    ToDoModel(id: const Uuid().v4(), description: "Ders çalış"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(
          children: [
            const TitleWidget(),
            TextFormField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: "What will you do today ? "),
              onFieldSubmitted: (value) {
                print("$value");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ToolBarWidget(),
            for (var i = 0; i < _allToDos.length; i++)
              Dismissible(
                key: ValueKey(_allToDos[i].id),
                child: ToDoListItemWidget(
                  toDoModel: _allToDos[i],
                ),
                onDismissed: (direction) {
                  
                },
              )
          ],
        ),
      ),
    );
  }
}
