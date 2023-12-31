import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/domain/entities/note.dart';

import '../providers/providers.dart';
import 'screens.dart';

class NoteScreen extends  ConsumerStatefulWidget {
  static const String name = 'note-screen';

  const NoteScreen({super.key});

  @override
  NoteScreenState createState() => NoteScreenState();
}

class NoteScreenState extends ConsumerState<NoteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Note newNote = ref.read(newNoteProvider);
      ref.read(titleControllerProvider.notifier).updateTitle(newNote.title);
      ref.read(descriptionControllerProvider.notifier).updateDescription(newNote.description);
    });
  }

  @override
  Widget build(BuildContext context) {

    Note newNote = ref.watch(newNoteProvider);
    final titleController = ref.watch( titleControllerProvider );
    final descriptionController = ref.watch( descriptionControllerProvider );

    return Scaffold(
      appBar: AppBar(
        title: Text(titleController.text.isEmpty ? 'New note' : titleController.text),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Aquí puedes manejar la lógica para guardar la nota
              // Puedes acceder a titleController.text y _contentController.text
              context.pushNamed(HomeScreen.name);
              String title = ref.read( titleControllerProvider ).text;
              String description = ref.read( descriptionControllerProvider ).text;
              String color = newNote.color;
              String id = newNote.id;
              print('Title: $title');
              print('Description: $description');
              print('ID: $id');
              print('Color: $color');

              // * Si no hay título o descripción, no se guarda la nota
              if (title.isEmpty && description.isEmpty) return ;
              // * Guardar la nota en multiples casos
              if (title.isNotEmpty && description.isEmpty ){
                description = description.isEmpty ? '...' : description;
                ref.read(noteProviderProvider.notifier).addNote(title, description);
              } else if (title.isEmpty && description.isNotEmpty){
                title = title.isEmpty ? '...' : title;
                ref.read(noteProviderProvider.notifier).addNote(title, description);
              } else if (title.isNotEmpty && description.isNotEmpty){
                ref.read(noteProviderProvider.notifier).addNote(title, description);
              }

              //TODO: Agregar los datos faltantes a la nota
              // FirebaseFirestore.instance.collection('notes').add({
              //   'title': title,
              //   'description': description,
              //   'color': color,
              //   'id': id,
              // });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: titleController,
            onChanged: (text) {
              setState(() {}); // Esto vuelve a construir el widget al cambiar el texto
            },
            decoration: const InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Enter your note here',
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 18),
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
