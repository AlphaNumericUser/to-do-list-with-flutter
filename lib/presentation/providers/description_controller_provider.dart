
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'description_controller_provider.g.dart';

@riverpod
class DescriptionController extends _$DescriptionController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  void updateDescription(String description) {
    state = TextEditingController(text: description);
  }
}

@riverpod
class SelectedDescriptionController extends _$SelectedDescriptionController {
  
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  void updateSelectedDescription(String description) {
    state = TextEditingController(text: description);
  }

}