
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF2864E8);
    const darkText = Color(0xFF202938);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan Digital',

      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: const Color(0xFFF7F8FA),

        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F8FA),
          foregroundColor: darkText,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: darkText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: Color(0xFFE6EAF0),
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: Color(0xFFE6EAF0),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              color: primaryBlue,
              width: 1.4,
            ),
          ),
        ),
      ),

      home: const LoginPage(),
    );
  }
}
