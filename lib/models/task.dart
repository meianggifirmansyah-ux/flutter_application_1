
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

  // Mengubah data buku menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'pages': pages,
      'available': available,
      'color': color.toARGB32(),
    };
  }

  // Membaca JSON menjadi objek Task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      pages: json['pages'] as int,
      available: json['available'] as bool,
      color: Color(json['color'] as int),
    );
  }
}
