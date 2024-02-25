class Task {
  final String name;
  final String description;
  bool isDone;

  Task({required this.description, required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
