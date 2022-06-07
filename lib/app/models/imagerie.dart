class Imagerie {
  Imagerie({
    required this.id,
    required this.type,
    required this.date,
    required this.imagerieList,
  });

  final String id;
  final String type;
  final DateTime date;
  final List<String> imagerieList;

  factory Imagerie.fromMap(Map<String, dynamic> data, String documentId) {
    final String id = documentId;
    final String type = data['type'] as String;
    final DateTime date = data['date'] as DateTime;
    final List<String> imagerieList = data[' imagerieList'] as List<String>;

    return Imagerie(
      id: id,
      imagerieList: imagerieList,
      date: date,
      type: type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagerieList': imagerieList,
      'date': date,
      'type': type,
    };
  }
}
