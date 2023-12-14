
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/presentation/providers/notes_providers.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends ConsumerWidget {

  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final noteProvider = ref.watch( noteProviderProvider );
  Color? colorButton = Colors.grey[600];
  Color? colorIcon = Colors.grey[50];

    return Scaffold(

      backgroundColor: Colors.grey[50],

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

          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),

        ],
      ),
      
      floatingActionButton: SpeedDial(
        buttonSize: const Size(60, 60),
        childrenButtonSize: const Size(62, 62),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22, color: colorIcon),
        backgroundColor: colorButton,
        visible: true,
        curve: Curves.bounceIn,
        spacing: 8,
        spaceBetweenChildren: 10,
        children: [

          SpeedDialChild(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.add, size: 28, color: colorIcon,),
            backgroundColor: colorButton,
            onTap: () {
              ref.read(titleControllerProvider).text = '';
              ref.read(descriptionControllerProvider).text = '';
              context.pushNamed(NoteScreen.name);
            },
            label: 'Add note',
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.5, color: colorIcon),
            labelBackgroundColor: colorButton,
          ),

          SpeedDialChild(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.delete, size: 28, color: colorIcon,),
            backgroundColor: colorButton,
            onTap: () {
              ref.read(noteProviderProvider.notifier).removeAllNotes();
            },
            label: 'Delete all notes',
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.5, color: colorIcon),
            labelBackgroundColor: colorButton,
          ),

        ],
      ),
    );
  }
}
