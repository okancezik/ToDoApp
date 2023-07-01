import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/product/models/to_do_model.dart';
import 'package:to_do_app/product/providers/all_providers.dart';

class ToDoListItemWidget extends ConsumerStatefulWidget {
  final ToDoModel toDoModel;
  const ToDoListItemWidget({super.key, required this.toDoModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ToDoListItemWidgetState();
}

class _ToDoListItemWidgetState extends ConsumerState<ToDoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textEditingController;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocus = false;
          });

          ref.read(todoProvider.notifier).edit(
              id: widget.toDoModel.id,
              newDescription: _textEditingController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
          });
          _textFocusNode.requestFocus();
          _textEditingController.text = widget.toDoModel.description;
        },
        leading: Checkbox(
          value: widget.toDoModel.isCompleted,
          onChanged: (value) {
            //print(value.toString());
            ref.read(todoProvider.notifier).toogle(widget.toDoModel.id);
          },
        ),
        title: _hasFocus
            ? TextFormField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                /*
                onFieldSubmitted: (value) {
                  ref.read(todoProvider.notifier).edit(id: widget.toDoModel.id, newDescription: value);
                },
                */
              )
            : Text(widget.toDoModel.description),
      ),
    );
  }
}
