import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';
import 'screens.dart';

class SelectedNoteScreen extends ConsumerStatefulWidget {
  static const String name = 'selected-note-screen';

  const SelectedNoteScreen({super.key});

  @override
  NoteScreenState createState() => NoteScreenState();
}

class NoteScreenState extends ConsumerState<SelectedNoteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final selectedNote = ref.read(selectedNoteProvider);
      ref.read(selectedTitleControllerProvider.notifier).updateSelectedTitle(selectedNote.title);
      ref.read(selectedDescriptionControllerProvider.notifier).updateSelectedDescription(selectedNote.description);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedNote = ref.watch(selectedNoteProvider);
    final selectedTitleController = ref.watch(selectedTitleControllerProvider);
    final descriptionController = ref.watch(selectedDescriptionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNote.title.isEmpty ? 'New note' : selectedNote.title),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.pushNamed(HomeScreen.name);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: selectedTitleController,
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