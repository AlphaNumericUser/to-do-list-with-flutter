import 'package:go_router/go_router.dart';
import 'package:to_do_list/presentation/screens/selected_note_screen.dart';

import '../../presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    
    //! General
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/note-screen',
      name: NoteScreen.name,
      builder: (context, state) => const NoteScreen(),
    ),

    GoRoute(
      path: '/selected-note-screen',
      name: SelectedNoteScreen.name,
      builder: (context, state) => const SelectedNoteScreen(),
    ),


]);