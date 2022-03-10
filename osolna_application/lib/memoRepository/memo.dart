class Memo {
  final int? id;
  final String? title;
  final String? content;
  final String? dateTime;

  Memo({this.id, this.title, this.content, this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime': dateTime.toString(),
    };
  }

  @override
  String toString() {
    return '{$id, $title, $content, $dateTime}';
  }
}
