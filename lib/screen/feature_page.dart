
import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitur Utama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Daftar Fitur',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            const Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Fitur 1'),
                subtitle: Text(
                  'Deskripsi singkat fitur pertama.',
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Fitur 2'),
                subtitle: Text(
                  'Deskripsi singkat fitur kedua.',
                ),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
