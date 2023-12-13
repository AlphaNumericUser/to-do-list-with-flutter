import 'package:go_router/go_router.dart';

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


]);