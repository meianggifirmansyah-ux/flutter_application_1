
import 'package:flutter/material.dart';
import 'data_page.dart';
import 'feature_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _HomeTab(),
    DataPage(),
    FeaturePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),

          child: Scaffold(
            backgroundColor: const Color(0xFFF7F8FA),

            body: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),

            bottomNavigationBar: NavigationBar(
              height: 65,
              backgroundColor: Colors.white,
              indicatorColor: const Color(0xFFEDF4FF),
              selectedIndex: _selectedIndex,

              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),

                NavigationDestination(
                  icon: Icon(Icons.search),
                  selectedIcon: Icon(Icons.search),
                  label: 'Cari',
                ),

                NavigationDestination(
                  icon: Icon(Icons.menu_book_outlined),
                  selectedIcon: Icon(Icons.menu_book),
                  label: 'Pinjaman',
                ),

                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// HALAMAN BERANDA
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2864E8);
    const grey = Color(0xFF7D8794);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Beranda',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFEDF4FF),
              child: Text(
                'AK',
                style: TextStyle(
                  color: blue,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            'Selamat datang kembali, Andi!',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Temukan bacaan yang menarik hari ini.',
            style: TextStyle(
              color: grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 20),

          // BANNER
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(17),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 29,
                ),

                SizedBox(height: 12),

                Text(
                  'Jelajahi dunia melalui buku',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Temukan koleksi dan mulai membaca.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Aktivitas membaca',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: _HomeStatCard(
                  value: '3',
                  title: 'Buku aktif',
                  icon: Icons.menu_book,
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: _HomeStatCard(
                  value: '5',
                  title: 'Buku favorit',
                  icon: Icons.bookmark_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// KARTU STATISTIK
class _HomeStatCard extends StatelessWidget {
  final String value;
  final String title;
  final IconData icon;

  const _HomeStatCard({
    required this.value,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE8ECF2),
        ),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 19,
            backgroundColor: const Color(0xFFEDF4FF),
            child: Icon(
              icon,
              color: const Color(0xFF2864E8),
              size: 20,
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF7D8794),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
