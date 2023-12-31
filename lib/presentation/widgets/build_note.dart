import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/domain/entities/note.dart';
import 'package:to_do_list/presentation/providers/notes_providers.dart';
import 'package:to_do_list/presentation/screens/selected_note_screen.dart';

import '../providers/providers.dart';

class BuildNote extends ConsumerWidget {

  final String id;
  final String title;
  final String description;
  final String color; 

  const BuildNote({super.key, 
    required this.id,
    required this.title,
    required this.description,
    required this.color
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla de edición de la nota
        Note selectedNote = ref.read(noteProviderProvider.notifier).findById(id);
        ref.watch(selectedNoteProvider.notifier).updateSelectedNote(selectedNote);
        context.pushNamed(SelectedNoteScreen.name);

      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          // Eliminar la nota de la lista
          ref.read(noteProviderProvider.notifier).removeNote( id );
          
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(int.parse(color.substring(1), radix: 16) + 0xFF000000), // Convert the color string to a Color object
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24), maxLines: 2,),
                Text(description, style: const TextStyle(fontSize: 18), maxLines: 3,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}