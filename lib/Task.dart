class Task {
  final String id;
  final String user;
  final String name;
  final String description;
  final bool status;
  final DateTime date;
  Task({
    required this.id,
    required this.user,
    required this.name,
    required this.description,
    required this.status,
    required this.date,
  });

  factory Task.fromJson(json) {
    final date = new DateTime.now();
    return Task(
      id: json["_id"] as String,
      user: json["user"] as String,
      name: json["name"] as String,
      description: json["description"] as String,
      status: json["status"] as bool,
      date: date,
    );
  }
}
