// ignore_for_file: public_member_api_docs, sort_constructors_first

class Note {

  final String id;
  final String title;
  final String description;
  final String color; // Cambiado de Color a String

  Note({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.color // Cambiado de Color a String
  });

  // bool get done {
  //   return completedAt != null; // true or false
  // }

  Note copyWith({
    String? id,
    String? title,
    String? description,
    String? color, // Cambiado de Color a String
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color, // Cambiado de Color a String
    );
  }
}
