
class Reminder {
  final String title;
  final String description;
  final DateTime dateTime;

  Reminder({required this.title, required this.description, required this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory Reminder.fromJson(Map<String, dynamic> json)  {
    return Reminder(
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
