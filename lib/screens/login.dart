
import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = true;
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan kata sandi wajib diisi.'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2864E8);
    const grey = Color(0xFF7D8794);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const SizedBox(height: 5),

                  // LOGO
                  Center(
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDF4FF),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Icon(
                        Icons.menu_book_outlined,
                        color: blue,
                        size: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Perpustakaan Digital',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Temukan cerita, perluas wawasan.\n'
                    'Semua buku, dalam genggaman.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                      height: 1.45,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // JUDUL LOGIN
                  const Text(
                    'Selamat datang kembali',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Masuk untuk melanjutkan bacaan Anda.',
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 21),

                  // EMAIL
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 7),

                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'Masukkan email',
                    ),
                  ),

                  const SizedBox(height: 15),

                  // PASSWORD
                  const Text(
                    'Kata sandi',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 7),

                  TextField(
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: 'Masukkan kata sandi',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  // INGAT SAYA
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),

                      const Text(
                        'Ingat saya',
                        style: TextStyle(fontSize: 11),
                      ),

                      const Spacer(),

                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Fitur lupa kata sandi belum tersedia.',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Lupa kata sandi?',
                          style: TextStyle(
                            fontSize: 11,
                            color: blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // TOMBOL LOGIN
                  SizedBox(
                    height: 48,
                    child: FilledButton(
                      onPressed: _login,
                      style: FilledButton.styleFrom(
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // REGISTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum punya akun? ',
                        style: TextStyle(
                          color: grey,
                          fontSize: 11,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Daftar sekarang',
                          style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // INFORMASI
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF4FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Satu akun, banyak pengetahuan',
                          style: TextStyle(
                            color: blue,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Pinjam buku digital, simpan bacaan favorit, '
                          'dan pantau jadwal pengembalian.',
                          style: TextStyle(
                            color: grey,
                            fontSize: 10,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Dengan masuk, Anda menyetujui Ketentuan Layanan '
                    'dan Kebijakan Privasi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA5ACB7),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
