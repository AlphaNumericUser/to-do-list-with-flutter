
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'description_controller_provider.g.dart';

@riverpod
class DescriptionController extends _$DescriptionController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}