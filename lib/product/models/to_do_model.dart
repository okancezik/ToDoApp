class ToDoModel {
  final String id;
  final String description;
  final bool isCompleted;

  ToDoModel(
      {required this.id, required this.description, this.isCompleted=false});
}
