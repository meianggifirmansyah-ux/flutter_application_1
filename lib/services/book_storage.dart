
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class BookStorage {
  static const String _storageKey = 'saved_books';

  // Menyimpan seluruh daftar buku
  static Future<void> saveBooks(List<Task> books) async {
    final prefs = await SharedPreferences.getInstance();

    final String encodedData = jsonEncode(
      books.map((book) => book.toJson()).toList(),
    );

    await prefs.setString(_storageKey, encodedData);
  }

  // Membaca daftar buku yang tersimpan
  static Future<List<Task>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();

    final String? savedData = prefs.getString(_storageKey);

    if (savedData == null || savedData.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> decodedData = jsonDecode(savedData);

      return decodedData.map((item) {
        return Task.fromJson(
          Map<String, dynamic>.from(item),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }


  // Memeriksa apakah data buku pernah disimpan
  static Future<bool> hasSavedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_storageKey);
  }


  // Menghapus seluruh data buku tersimpan
  static Future<void> clearBooks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
