// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteProviderHash() => r'830aa8c6cd1ff0cb61b19cec26031fc1209c646b';

/// See also [NoteProvider].
@ProviderFor(NoteProvider)
final noteProviderProvider =
    AutoDisposeNotifierProvider<NoteProvider, List<Note>>.internal(
  NoteProvider.new,
  name: r'noteProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$noteProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NoteProvider = AutoDisposeNotifier<List<Note>>;
String _$selectedNoteHash() => r'2888ed61253eb5984e30fb0ac7d9e2fb56f9609a';

/// See also [SelectedNote].
@ProviderFor(SelectedNote)
final selectedNoteProvider =
    AutoDisposeNotifierProvider<SelectedNote, Note>.internal(
  SelectedNote.new,
  name: r'selectedNoteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedNoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedNote = AutoDisposeNotifier<Note>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
