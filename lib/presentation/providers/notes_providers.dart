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
  const Color(0xFFFFB4B4),
  const Color(0xFFB0BBBC),
  const Color(0xFFE4B875),
  const Color(0xFFBBB2CC),
  const Color(0xFF5FBDF5),
  const Color(0xFF4FC2BC),
  const Color(0xFFFDF7C3),
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
        _createNote("Title 1", "Description 1"),
        _createNote("Title 2", "Description 2"),
        _createNote("Title 3", "Description 3"),
      ];

  // Método para agregar una nueva nota a la lista
  void addNote() {
    state = [
      ...state,
      _createNote("Title ${state.length + 1}", "Description ${state.length + 1}"),
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
}
