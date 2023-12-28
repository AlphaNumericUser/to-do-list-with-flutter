// Importaciones necesarias para Flutter y paquetes externos
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

// Importación de la entidad 'Note' desde el dominio
import '../../domain/entities/note.dart';

// Generación de providers utilizando riverpod_annotation
part 'notes_providers.g.dart';

// Creación de una instancia de la clase Uuid para generar identificadores únicos
const uuid = Uuid();

// Lista de colores para asignar a las notas
final List<Color> containerColors = [
  Colors.orange[100]!,
  Colors.red[100]!,
  Colors.blue[100]!,
  Colors.green[100]!,
  Colors.purple[100]!,
  Colors.teal[100]!,
  // Agrega más colores según sea necesario
];

// Definición del provider de notas utilizando Riverpod
@riverpod
class NoteProvider extends _$NoteProvider {
  
  // Índice del último color utilizado, inicializado en -1
  int lastColorIndex = -1;

  // Método para construir la lista inicial de notas
  @override
  List<Note> build() => [
        _createNote("My first note :)", "Hi there!"),
      ];

  // Método para agregar una nueva nota a la lista, pedirá un título y una descripción
  void addNote(String title, String description) {
    state = [
      ...state,
      _createNote(title, description),
    ];
  }

  // Método privado para crear una nueva nota con un color asignado
  Note _createNote(String title, String description) {
    int nextColorIndex;
    // Ciclo para asegurarse de que el próximo color no sea igual al último
    do {
      nextColorIndex = (lastColorIndex + 1) % containerColors.length;
    } while (nextColorIndex == lastColorIndex);
    lastColorIndex = nextColorIndex;
    // Creación de la instancia de la entidad Note
    return Note(
      id: uuid.v4(),
      title: title,
      description: description,
      color: containerColors[nextColorIndex],
    );
  }

  // Método para eliminar una nota por su ID
  void removeNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }

  // Método para eliminar todas las notas
  void removeAllNotes() {
    state = [];
  }

  Note findById(String id) {
    return state.firstWhere((note) => note.id == id);
  }

}

@riverpod
class SelectedNote extends _$SelectedNote {
  @override
  Note build() {
    return Note(id:'', title: '', description: '', color: Colors.white);
  }

  void updateSelectedNote (Note note) {
    state = note;
  }
}