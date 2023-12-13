import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'title_controller_provider.g.dart';

@riverpod
class TitleController extends _$TitleController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}