import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/providers/all_providers.dart';
import 'package:to_do_app/product/widgets/title_widget.dart';
import 'package:to_do_app/product/widgets/todo_list_item_widget.dart';
import 'package:to_do_app/product/widgets/toolbar_widget.dart';

class ToDoApp extends ConsumerWidget {
  ToDoApp({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allToDos = ref.watch(todoProvider);

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
                //print("$value");
                ref.read(todoProvider.notifier).addToDo(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ToolBarWidget(),
            for (var i = 0; i < allToDos.length; i++)
              Dismissible(
                key: ValueKey(allToDos[i].id),
                child: ToDoListItemWidget(
                  toDoModel: allToDos[i],
                ),
                onDismissed: (direction) {
                  ref.read(todoProvider.notifier).remove(allToDos[i]);
                },
              )
          ],
        ),
      ),
    );
  }
}
