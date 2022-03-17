class Task {
  final String title;
  bool state;

  Task({required this.title, this.state = false});

  void updateState() {
    state = !state;
  }
}
