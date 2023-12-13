
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/presentation/providers/notes_providers.dart';

import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  //   final List<Color> containerColors = [
  //   const Color(0xFFB0BBBC),
  //   const Color(0xFFE4B875),
  //   const Color(0xFFBBB2CC),
  //   const Color(0xFF5FBDF5),
  //   const Color(0xFF4FC2BC),
  //   // Agrega más colores según sea necesario
  // ];

  final noteProvider = ref.watch( noteProviderProvider );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          const SliverToBoxAdapter(
            child: SizedBox(height: 50),
          ),
          const SliverToBoxAdapter(
            child: TitleUp(),
          ),

          // * Usar un ConsumerBuilder para reconstruir la lista según la cantidad de notas
          Consumer(builder: (context, ref, child) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BuildNote(
                    id: noteProvider[index].id,
                    title: noteProvider[index].title,
                    description: noteProvider[index].description,
                    color: noteProvider[index].color,
                  );
                },
                childCount: noteProvider.length,
              ),
            );
          }),

        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () {
              ref.read(noteProviderProvider.notifier).addNote();
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            onPressed: () {
              ref.read(noteProviderProvider.notifier).removeAllNotes();
            },
            child: const Icon(Icons.delete),
          ),

        ],
      )
    );
  }
}
