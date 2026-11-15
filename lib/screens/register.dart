
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Pendaftaran berhasil! Silakan masuk.',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2864E8);
    const grey = Color(0xFF7D8794);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF202938),
        elevation: 0,
        title: const Text(
          'Daftar Akun',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),

            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),

              child: Form(
                key: _formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    const SizedBox(height: 10),

                    // LOGO
                    Center(
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDF4FF),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: const Icon(
                          Icons.menu_book_outlined,
                          color: blue,
                          size: 32,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Buat Akun Baru',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Daftarkan diri Anda untuk menikmati '
                      'layanan Perpustakaan Digital.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // NAMA
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,

                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Masukkan nama lengkap',
                      ),

                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Nama lengkap wajib diisi';
                        }

                        if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 17),

                    // EMAIL
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,

                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: 'Masukkan email',
                      ),

                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Email wajib diisi';
                        }

                        if (!RegExp(
                          r'^[^@]+@[^@]+\.[^@]+$',
                        ).hasMatch(value.trim())) {
                          return 'Format email tidak valid';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 17),

                    // PASSWORD
                    const Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _hidePassword,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),

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

                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Kata sandi wajib diisi';
                        }

                        if (value.length < 6) {
                          return 'Kata sandi minimal 6 karakter';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 17),

                    // KONFIRMASI PASSWORD
                    const Text(
                      'Konfirmasi Kata Sandi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _hideConfirmPassword,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),

                        hintText: 'Ulangi kata sandi',

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hideConfirmPassword =
                                  !_hideConfirmPassword;
                            });
                          },

                          icon: Icon(
                            _hideConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),

                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return 'Konfirmasi kata sandi wajib diisi';
                        }

                        if (value != _passwordController.text) {
                          return 'Kata sandi tidak sama';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 27),

                    // TOMBOL DAFTAR
                    SizedBox(
                      height: 49,

                      child: FilledButton(
                        onPressed: _register,

                        style: FilledButton.styleFrom(
                          backgroundColor: blue,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        child: const Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),

                    // KEMBALI LOGIN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya akun? ',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },

                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Perpustakaan Digital • 2026',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA5ACB7),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
