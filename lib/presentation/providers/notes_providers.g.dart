// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteProviderHash() => r'a7d470ee45b23ad8fe3fcbba7c8767fcbda68366';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
