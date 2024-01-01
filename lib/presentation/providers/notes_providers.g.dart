// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteProviderHash() => r'fbef873d0f55e686811bcdda05b4af88b0c793cc';

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
String _$selectedNoteHash() => r'bbc4c29d4fa6c649febdc52675600fe3897d95c7';

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
String _$newNoteHash() => r'f2551a6cd2c11a967db3e9e2fdf0d1ca012c860f';

/// See also [NewNote].
@ProviderFor(NewNote)
final newNoteProvider = AutoDisposeNotifierProvider<NewNote, Note>.internal(
  NewNote.new,
  name: r'newNoteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newNoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewNote = AutoDisposeNotifier<Note>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
