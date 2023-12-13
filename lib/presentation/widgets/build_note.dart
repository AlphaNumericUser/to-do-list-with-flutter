// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/presentation/providers/notes_providers.dart';

class BuildNote extends ConsumerWidget {

  final String id;
  final String title;
  final String description;
  final Color color;

  const BuildNote({super.key, 
    required this.id,
    required this.title,
    required this.description,
    required this.color
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        // Eliminar la nota de la lista
        ref.read(noteProviderProvider.notifier).removeNote( id );
        
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
              Text(description, style: const TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
