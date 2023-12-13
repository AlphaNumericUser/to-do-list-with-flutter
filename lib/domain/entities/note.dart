// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class Note {

  final String id;
  final String title;
  final String description;
  final Color color;

  Note({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.color
  });

  // bool get done {
  //   return completedAt != null; // true or false
  // }


  Note copyWith({
    String? id,
    String? title,
    String? description,
    Color? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }
}
