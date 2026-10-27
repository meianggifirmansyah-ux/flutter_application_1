import 'package:flutter/material.dart';

class Task {
  final int id;
  String title;
  String author;
  int pages;
  bool available;
  Color color;

  Task({
    required this.id,
    required this.title,
    required this.author,
    required this.pages,
    required this.available,
    required this.color,
  });
}