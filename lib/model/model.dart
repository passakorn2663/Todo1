import 'package:flutter/material.dart';

@immutable
class Todo {
  Todo(this.complete, this.id, this.title, this.detail);

  final bool complete;
  final int id;
  final String title;
  final String detail;
}
